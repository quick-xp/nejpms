#coding: utf-8
class ProductResult

  include DataMapper::Resource

  storage_names[:default] = 'ProductResult'
  property :id, Serial,field: 'id' ,key:true,required:true

  property :type_id, Integer,field:'typeID'
  property :owner_id, Integer,field:'userID'
  property :create_count, Integer,field:'createCount'
  property :sum_price, Float,field:'sumPrice'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :user, 'UserList',
    parent_key: [:user_id],
    child_key:[:owner_id]

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


end
