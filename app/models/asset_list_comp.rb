# coding: utf-8

class AssetListsComp
  include DataMapper::Resource

  storage_names[:default] = 'AssetList_Comp'
  property :item_id,Integer, field: 'itemID', key:true, required: true
  property :quantity,Integer, field: 'quantity'
  property :type_id,Integer, field: 'typeID'
  property :location_id,Integer, field: 'locationID'
  property :flag,Integer, field:'flag'

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
