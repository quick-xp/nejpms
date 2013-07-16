# coding: utf-8

class AssetListsComp
  include DataMapper::Resource

  storage_names[:default] = 'AssetList_Comp'

  property :id, Serial,field: 'id', key:true, required:true
  property :type_id,Integer, field: 'typeID'
  property :quantity,Integer, field: 'quantity'
  property :station_id,Integer, field: 'stationID'
  property :sync_flag,Integer, field:'syncFlag'
  property :comment,String,field:'comment',length: 200
  property :sync_type,Integer,field:'syncType' #0:原料仕入れ #1生産実績 #2 出庫 #3 棚卸
  property :sync_id,Integer,field: 'syncID'
  property :add_date,DateTime

  def reflect_asset_waiting
    targets = AssetListsComp.all(order: :add_date.asc)

    puts targets
    targets.each{ |target|

      if target.sync_flag == 0 then
        #在庫更新
        t = AssetListMaster.first(:type_id => target.type_id,:station_id => target.station_id)
          #在庫数量更新
        if t == nil then
          AssetListMaster.new(:type_id => target.type_id,
                              :quantity => target.quantity,
                              :station_id => target.station_id).save
          q = 0
        elsif target.quantity.to_i + t.quantity.to_i <= 0 then
          q = t.quantity.to_i
          t.destroy
        else
          q = t.quantity.to_i
          t.update(:quantity => target.quantity.to_i + t.quantity.to_i)
        end
        #反映待ちを反映済みに更新
          target.update(:sync_flag => 1)
          #在庫推移登録
          InventoryTransitions.new(:type_id => target.type_id,
                                   :location_id => target.station_id,
                                   :count => target.quantity.to_i,
                                   :add_date => target.add_date,
                                   :current_quantity => target.quantity.to_i + q).save
      end
    }

  end
end
