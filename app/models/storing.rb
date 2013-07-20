#coding: utf-8
class Storing
  include DataMapper::Resource

  storage_names[:default] = 'Store'

  property :id, Serial,field: 'id', key:true, required:true
  property :type_id,Integer, field: 'typeID'
  property :quantity,Integer, field: 'quantity'
  property :station_id,Integer, field: 'stationID'
  property :add_date, DateTime

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :station, 'StaStations',
    parent_key: [:station_id],
    child_key: [:station_id]

  def get_type_name
    begin
      return self.item.type_name
    rescue
      return ''
    end
  end

  def get_station_name
    begin
      return self.sta.station_name
    rescue
      return ''
    end
  end

end
