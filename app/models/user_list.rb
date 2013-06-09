# coding: utf-8
class UserList

  include DataMapper::Resource

  storage_names[:default] = 'UserList'

  property :user_id, Integer,field: 'userID',key:true,required: true
  property :user_name, String,field: 'userName'

end
