#coding: utf-8
class MaterialPurchase

  include DataMapper::Resource

  storage_names[:default] = 'MaterialPurchase'

  property :id, Serial,field: 'id' , key:true, required: true
  property :transaction_id,Integer, field: 'transactionID'
  property :quantity,Integer, field: 'quantity'
  property :type_id,Integer, field: 'typeID'
  property :price, Float, field: 'price'
  property :station_id,Integer, field: 'stationID'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :sta, 'StaStations',
    parent_key: [:station_id],
    child_key: [:station_id]

  def valid_item_name(type_name)
    if not InvTypes.all(:type_name.like => "#{type_name.strip}", limit: 1).present?
      return [false, "不正なアイテム名です。"]
    end
    true
  end

  def get_type_name
    begin
      return self.item.type_name
    rescue
      return ''
    end
  end

  def get_station_name
    begin
      return self.sta.station_name
    rescue
      return ''
    end
  end

end
