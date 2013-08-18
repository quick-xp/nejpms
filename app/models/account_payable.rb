#coding: utf-8
class AccountPayable
  include DataMapper::Resource

  storage_names[:default] = 'AccountPayable'

  property :id,Integer,required:true, key:true
  property :transaction_date_time, DateTime,field:'transactionDateTime'
  property :user_id, Integer,field:'userID'
  property :price, Integer,field:'price'
  property :status, Integer,field:'status'
  property :comment, String,field:'comment'
  property :operation_date_time, DateTime,field:'operationDateTime'

  belongs_to :status_list, 'StatusMaster',
    parent_key: [ :key_id ],
    child_key: [ :status ],
    group: 1

  belongs_to :user, 'UserList',
    parent_key: [:user_id],
    child_key:[:user_id]

  # 支払未の買掛金合計
  def get_not_pay_price_total
    total = AccountPayable.sum(:price, :conditions => ['status = ?','1'])
    total
  end

  # 支払未のユーザ別買掛金合計
  def get_not_pay_price_total_each_user(user_id)
    total = AccountPayable.sum(:price, :conditions => ['status = ? and userID = ?','1',user_id])
    total
  end
end
