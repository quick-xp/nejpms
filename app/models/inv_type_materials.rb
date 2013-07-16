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


  def asset(station_id)
    AssetListMaster.all(:type_id => self.material_type_id,:station_id => station_id).first
  end

  # 指定したアイテムの生産可能数を取得する
  def self.producible_count(type_id,station_id)
    required_materials = self.all(type_id: type_id)
    required_materials
      .map { |r| (r.asset(station_id).present? ? r.asset(station_id).quantity : 0) / r.quantity }
      .min
  end

  def requisite_amount_for_create(create_count)
    self.quantity * create_count
  end

  def shortage_material?(product_create_count,station_id)
    if self.asset(station_id).nil?
      true
    else
      asset(station_id).quantity < requisite_amount_for_create(product_create_count)
    end
  end

  def shortage_count(product_create_count,station_id)
    if shortage_material?(product_create_count,station_id)
      if asset(station_id).nil?
        requisite_amount_for_create(product_create_count)
      else
        requisite_amount_for_create(product_create_count) - asset(station_id).quantity
      end
    else
      0
    end
  end

end
