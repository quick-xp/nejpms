# coding: utf-8

class InventoryTransitions
  include DataMapper::Resource

  storage_names[:default] = 'InventoryTransition'

  property :id, Serial,field: 'id' ,required: true, key: true
  property :type_id, Integer, field: 'typeID'
  property :location_id, Integer, field: 'locationID'
  property :count, Float, field: 'count'
  property :add_date, DateTime, field: 'addDate'
  property :current_quantity, Integer, field: 'currentQuantity'
  property :comment,String,field:'comment',length: 200
  property :sync_type,Integer,field:'syncType' #0:原料仕入れ #1生産実績 #2 出庫 #3 棚卸
  property :sync_id,Integer,field: 'syncID'

  attr_accessor :item_name

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  def self.latest_transitions
    sql = <<-EOF
    select
      i1.id as id,
      i1.typeID as type_id,
      i1.locationID as location_id,
      i1.count as count,
      i1.addDate as add_date,
      i1.currentQuantity as current_quantity,
      inv.typeName as item_name,
      i1.comment as comment
    from
      InventoryTransition i1
    inner join
      invTypes as inv
    on
      i1.typeID = inv.typeID
    where not exists
    (
      select
        *
      from
        InventoryTransition as i2
      where
        i2.typeID = i1.typeID
        and i2.id > i1.id
    )
    order by
      i1.typeID
    EOF
    select_by_raw_sql(sql)
  end

  def self.select_by_raw_sql(sql, params = [])
    result = repository(:default)
      .adapter
      .select(sql, *params)
    result.map do |r|
      c = InventoryTransitions.new
      r.each_pair { |k,v| c.__send__("#{k}=", v) }
      c
    end
  end

end
