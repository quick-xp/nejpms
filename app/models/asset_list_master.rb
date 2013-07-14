# coding: utf-8
class AssetListMaster
  include DataMapper::Resource

  storage_names[:default] = 'AssetListMaster'

  property :id, Serial,required:true, key:true
  property :type_id, Integer, field: 'itemID'
  property :quantity, Integer, field: 'quantity'
  property :station_id, Integer, field: 'stationID'

end
