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

  # 指定したアイテムの生産可能数を取得する
  def self.producible_count(type_id)
    required_materials = self.all(type_id: type_id)
    required_materials
      .map { |r| (r.asset.present? ? r.asset.quantity : 0) / r.quantity }
      .min
  end

  def requisite_amount_for_create(create_count)
    self.quantity * create_count
  end

  def shortage_material?(product_create_count)
    if asset.try(:quantity).nil?
      true
    else
      asset.quantity < requisite_amount_for_create(product_create_count)
    end
  end

  def shortage_count(product_create_count)
    if shortage_material?(product_create_count)
      requisite_amount_for_create(product_create_count) - asset.quantity
    else
      0
    end
  end

end
