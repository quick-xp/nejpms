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

  def get_total_sales_amounts
    sales = ProductSale.all
    total = 0
    sales.each {|sale|
      total += sale.price * sale.quantity
    }
    return total
  end

  def get_total_sales_amount(type_id)
    sales = ProductSale.all
    total = 0
    sales.each {|sale|
      if type_id == sale.type_id
        total += sale.price * sale.quantity
      end
    }
    return total
  end

  def get_total_sales_count(type_id)
    sales = ProductSale.all
    total = 0
    sales.each {|sale|
      if type_id == sale.type_id
        total += sale.type_id
      end
    }
    return total
  end

end
