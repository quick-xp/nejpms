# coding: utf-8

class WalletJournal
  include DataMapper::Resource

  storage_names[:default] = 'WalletJournal'

  property :transaction_id , Integer, field: 'transactionID', key: true, required: true
  property :transaction_date_time, DateTime, field: 'transactionDateTime'
  property :transaction_type_id, Integer, field: 'typeID'
  property :owner_name1, String, field: 'ownerName1'
  property :owner_id1, String, field: 'ownerID1'
  property :owner_name2, String, field: 'ownerName2'
  property :owner_id2, String, field: 'ownerID2'
  property :arg_name1, String, field: 'argName1'
  property :arg_id1, String, field: 'argID1'
  property :amount, Float, field: 'amount'
  property :balance, Float, field: 'balance'
  property :reason, String, field: 'Reason'
  property :tax_receiver_id, String, field: 'taxReceiverID'
  property :tax_amount, Float, field: 'taxAmount'

end
