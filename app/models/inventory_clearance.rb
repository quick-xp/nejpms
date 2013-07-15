#coding: utf-8
class InventoryClearance

  attr_accessor :type_id
  attr_accessor :type_name
  attr_accessor :current_quantity
  attr_accessor :current_sync_quantity
  attr_accessor :new_quantity

  def get_assets_lists(station_id)
   sql = <<-EOF
   select
    case when asset1.typeID is null then asset2.typeID else asset1.typeID end as type_id,
    case when asset1.typeName is null then asset2.typeName else asset1.typeName end as type_name,
    case when t2.quantity is null then 0 else t2.quantity end as current_quantity,
    case when t1.quantity is null then 0 else CAST(t1.quantity AS SIGNED) end as current_sync_quantity,
    case when t1.quantity is null then 0 else CAST(t1.quantity AS SIGNED) end as new_quantity
   from
      #--抽出アイテム対象
      ( select typeID from
      (select distinct typeID from AssetList union select distinct itemID as typeID from AssetListMaster ) as tt1 order by typeID asc
      ) as m1
   left outer join
      # 同期Asset List
      ( select typeID,sum(quantity) as quantity from AssetList
        #同期対象絞り込み
          inner join InvSetting
              on AssetList.flag = InvSetting.flagID
         where
        # station 指定
        ( case when locationID > 66000000 then locationID - 6000001 else locationID end = @station_id) or locationID is null
        group by typeID,quantity
      ) as t1
   on
      m1.typeID = t1.typeID
   left outer join
      AssetListMaster as t2
   on
      m1.typeID = t2.itemID
   #--Asset
   left outer join
      invTypes as asset1
   on
      asset1.typeID = t1.typeID
   left outer join
      invTypes as asset2
   on
      asset2.typeID = t2.itemID
   where
      #station 指定
      ( t2.stationID = @station_id or t2.stationID is null)
      #バグ回避用
      and ( case when asset1.typeID is null then asset2.typeID else asset1.typeID end is not null)

   EOF
   sql = sql.gsub("@station_id",station_id.to_s)
   select_by_raw_sql(sql)

  end


  def select_by_raw_sql(sql, params = [])
    result = repository(:default)
      .adapter
      .select(sql, *params)
    result.map do |r|
      c = InventoryClearance.new
      r.each_pair { |k,v| c.__send__("#{k}=", v) }
      c
    end
  end


end
