# coding: utf-8

class TrnTranslations
  include DataMapper::Resource

  storage_names[:default] = 'trnTranslations'

  property :tc_id, Serial, field: 'tcID', required: true, key: true
  property :key_id, Serial, field: 'keyID', required: true, key: true
  property :language_id, String, field: 'languageID'
  property :text, Text, field: 'text', lazy: false

end
