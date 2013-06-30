#coding: utf-8
class BluePrintPurchase

  include DataMapper::Resource

  storage_names[:default] = 'BluePrintPurchase'
  property :id, Serial,field: 'id', key:true, required:true

  property :type_id, Integer,field: 'typeID'
  property :use_count, Integer,field: 'useCount'
  property :price, Float,field: 'price'
  property :comment, String,field: 'comment'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

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

  def get_total_blueprint_amount
    purchases = BluePrintPurchase.all
    total = 0
    purchases.each {|purchase|
      total += purchase.price
    }
    return total
  end


end
