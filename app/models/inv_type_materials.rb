# coding: utf-8

class InvTypeMaterials
  include DataMapper::Resource

  storage_names[:default] = 'invTypeMaterials'

  property :type_id, Serial, field: 'typeID', required: true, key: true
  property :material_type_id, Integer, field: 'materialTypeID'
  property :quantity, Integer, field: 'quantity'

  belongs_to :product, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :material, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:material_type_id]

end
