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
  property :transaction_date_time,DateTime, field: 'transactionDateTime'

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

  def get_total_purchase_amounts
    material_purchases = MaterialPurchase.all
    total = 0
    material_purchases.each {|material_purchase|
      total += material_purchase.quantity * material_purchase.price
    }
    return total
  end

  def get_total_purchase_amount(type_id)
    material_purchases = MaterialPurchase.all
    total = 0
    material_purchases.each {|material_purchase|
      if type_id == material_purchase.type_id
        total += material_purchase.quantity * material_purchase.price
      end
    }
    return total
  end

end
