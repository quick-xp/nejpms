# coding: utf-8

class StaStations
  include DataMapper::Resource

  storage_names[:default] = 'staStations'

  property :station_id, Integer, field: 'stationID', required:true, key:true
  property :security, Integer, field: 'security'
  property :docking_cost_per_volume, Float, field: 'dockingCostPerVolume'
  property :max_ship_volume_dockable, Float, field: 'maxShipVolumeDockable'
  property :office_rental_cost, Integer, field: 'officeRentalCost'
  property :operation_id, Integer, field: 'operationID'
  property :station_type_id, Integer, field: 'stationTypeID'
  property :corporation_id, Integer, field: 'corporationID'
  property :solar_system_id, Integer, field: 'solarSystemID'
  property :constellation_id, Integer, field: 'constellationID'
  property :region_id, Integer, field: 'regionID'
  property :station_name, String, field: 'stationName'
  property :x, Float, field: 'x'
  property :y, Float, field: 'y'
  property :z, Float, field: 'z'
  property :reprocessing_efficiency, Float, field: 'reprocessingEfficiency'
  property :reprocessing_stations_take, Float, field: 'reprocessingStationsTake'
  property :reprocessing_hangar_flg, Integer, field: 'reprocessingHangarFlag'

end
