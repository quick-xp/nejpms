# coding: utf-8

class StatusMaster
  include DataMapper::Resource

  storage_names[:default] = 'statusMaster'

  property :group, Integer, field: 'group', required: true, key: true
  property :key_id,Integer, field: 'keyID',required:true,key:true
  property :key_name,String,field:'keyName'
end
