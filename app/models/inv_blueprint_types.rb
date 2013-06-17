#coding: utf-8

class InvBlueprintTypes

  include DataMapper::Resource

  storage_names[:default] = 'InvBlueprintTypes'

  property :id, Serial, field: 'blueprintTypeID', key: true, required:true
  property :parent_blueprint_type_id, Integer, field: 'parentBlueprintTypeID'
  property :product_type_id, Integer, field: 'ProductTypeID'
  property :production_time, Integer, field: 'ProductionTime'
  property :tech_level, Integer, field: 'techLevel'
  property :research_productivity_time, Integer, field: 'researchProductivityTime'
  property :research_material_time, Integer, field: 'researchMaterialTime'
  property :research_copy_time, Integer, field: 'researchCopyTime'
  property :research_tech_time, Integer, field: 'researchTechTime'
  property :productivity_modifier, Integer, field: 'productivityModifier'
  property :wasteFactor, Integer, field: 'wasteFactor'
  property :max_production_limit, Integer, field: 'maxProductionLimit'

  belongs_to :item, 'InvTypes',
    parent_key: [ :type_id ],
    child_key: [ :product_type_id ]

end
