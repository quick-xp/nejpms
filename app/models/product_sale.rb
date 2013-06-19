#coding : utf-8
class ProductSale

  include DataMapper::Resource

  storage_names[:default] = 'ProductSales'

  property :transaction_date_time,DateTime, field: 'transactionDateTime'
  property :transaction_id, Integer,field:'transactionID',key:true,required:true
  property :quantity, Integer,field: 'quantity'
  property :type_id, Integer,field: 'typeID'
  property :price, Float, field: 'price'
  property :client_id, String, field:'clientID'
  property :station_id, Integer,field: 'stationID'
  property :journal_transaction_id, String,field: 'journalTransactionID'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :sta, 'StaStations',
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
