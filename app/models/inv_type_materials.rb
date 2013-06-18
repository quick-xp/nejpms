# coding: utf-8

class InvTypeMaterials
  include DataMapper::Resource

  storage_names[:default] = 'invTypeMaterials'

  property :type_id, Serial, field: 'typeID', required: true, key: true
  property :material_type_id, Serial, field: 'materialTypeID', required: true, key: true
  property :quantity, Integer, field: 'quantity'

  belongs_to :product, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :material, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:material_type_id]

  belongs_to :asset, 'AssetLists',
    parent_key: [:type_id],
    child_key: [:material_type_id]

  def requisite_amount_for_create(create_count)
    self.quantity * create_count
  end

  def shortage_material?(product_create_count)
    asset.quantity < requisite_amount_for_create(product_create_count)
  end

end
