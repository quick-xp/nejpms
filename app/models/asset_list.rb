# coding: utf-8

class AssetLists
  include DataMapper::Resource

  storage_names[:default] = 'AssetList'
  property :item_id,Integer, field: 'itemID', key:true, required: true
  property :quantity,Integer, field: 'quantity'
  property :type_id,Integer, field: 'typeID'
  property :location_id,Integer, field: 'locationID'
  property :flag,Integer, field:'flag'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  #TODO locationIDとは何か
  belongs_to :sta, 'StaStations',
    parent_key: [:station_id],
    child_key: [:location_id]

  def valid_item_name(type_name)
    if not InvTypes.all(:type_name.like => "#{type_name.strip}", limit: 1).present?
      return [false, "不正なアイテム名です。"]
    end
    true
  end

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


  class << self
    def bulk_persist!(transaction)
      transaction.each do |tran|
        begin
          puts tran.item_id
          tran.save
        rescue
          puts "DB登録の際にエラーが発生しました"
        end
      end
    end
  end
end
