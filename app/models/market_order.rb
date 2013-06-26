# coding: utf-8
class MarketOrder
  include DataMapper::Resource

  storage_names[:default] = 'MarketOrder'
  property :order_id, Integer, field: 'orderID',key:true, required: true
  property :char_id, Integer, field: 'charID'
  property :station_id, Integer, field: 'stationID'
  property :vol_entered, Integer, field: 'volEntered'
  property :vol_remaining, Integer, field: 'volRemaining'
  property :min_volume, Integer, field: 'minVolume'
  property :order_state, Integer, field: 'orderState'
  property :type_id, Integer, field: 'typeID'
  property :range, Integer, field: 'range'
  property :account_key, Integer, field: 'accountKey'
  property :duration, Integer, field: 'duration'
  property :escrow, Float, field: 'escrow'
  property :price, Float, field: 'price'
  property :bid, Boolean, field: 'bid'
  property :issue, DateTime, field: 'issued'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :station, 'StaStations',
    parent_key: [:station_id],
    child_key: [:station_id]

  def get_type_name
    self.try(:item).try(:type_name)
  end

  def get_station_name
    self.try(:station).try(:station_name)
  end

  class << self
    def bulk_persist!(transaction)
      transaction.each do |tran|
        begin
          if MarketOrder.first(:order_id => tran.order_id) == nil then
           puts tran.order_id.to_s + " is save"
           tran.save
          else
            puts tran.order_id.to_s + " is already saved"
          end
        rescue => e
          puts "DB登録の際にエラーが発生しました"
          puts e.message
        end
      end
    end
  end
end
