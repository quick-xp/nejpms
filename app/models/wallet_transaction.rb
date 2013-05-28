# coding: utf-8

class WalletTransactions
  include DataMapper::Resource

  storage_names[:default] = 'WalletTransaction'
  property :transactionDateTime,DateTime, field: 'transactionDateTime'
  property :transactionID,Integer, field: 'transactionID', key:true, required: true
  property :quantity,Integer, field: 'quantity'
  property :typeName,String, field: 'typeName'
  property :typeID,Integer, field: 'typeID'
  property :price, Float, field: 'price'
  property :clientID,Integer, field: 'clientID'
  property :clientName,String, field: 'clientName'
  property :stationID,Integer, field: 'stationID'
  property :stationName,String, field: 'stationName'
  property :transactionType,String, field: 'transactionType'
  property :transactionFor,String, field: 'transactionFor'
  property :journalTransactionID,String, field: 'journalTransactionID'

  class << self
    def bulk_persist!(transaction)
      transaction.each do |tran|
        begin
          puts tran.transactionID
          if self.get(tran.transactionID) == nil then
             tran.save
          else
            puts "登録済みのためスキップします"
          end
        rescue
          puts "DB登録の際にエラーが発生しました"
        end
      end
    end
  end
end
