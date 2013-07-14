# coding: utf-8
class CorpLocation
  include DataMapper::Resource

  storage_names[:default] = 'CorpLocation'

  property :station_id, Integer, field:'stationID',key:true, required:true
  property :station_name, String,field:'stationName'

end
