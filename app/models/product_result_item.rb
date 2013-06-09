#coding: utf-8
class ProductResultItem

  include DataMapper::Resource

  storage_names[:default] = 'ProductResultItem'
  property :id, Serial,field: 'id',required:true
  property :relation_id,Integer,field: 'relationID'

  property :type_id, Integer,field:'typeID'
  property :use_item_count, Integer,field:'createItemCount'
  property :sum_price, Float,field:'sumPrice'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  def get_type_name
    begin
      return self.item.type_name
    rescue
      return ''
    end
  end


end
