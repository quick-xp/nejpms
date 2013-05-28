# coding: utf-8

class InventoryTransitions
  include DataMapper::Resource

  storage_names[:default] = 'InventoryTransition'
  property :id,Serial,field: 'id' ,required:true, key:true
  property :type_id,Integer, field: 'typeID'
  property :location_id,Integer, field: 'locationID'
  property :count,Float, field:'count'
  property :add_date,DateTime, field:'addDate'

end
