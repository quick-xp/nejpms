#coding: utf-8
class InventoryClearanceSetting
  include DataMapper::Resource

  storage_names[:default] = 'InvSetting'
  property :flag_id, Integer, field: 'flagID',key:true, required:true

end
