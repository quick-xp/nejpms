# coding: utf-8
class AssetListMaster
  include DataMapper::Resource

  storage_names[:default] = 'AssetListMaster'

  property :id, Serial,required:true, key:true
  property :type_id, Integer, field: 'itemID'
  property :quantity, Integer, field: 'quantity'
  property :station_id, Integer, field: 'stationID'

  belongs_to :item, 'InvTypes',
    parent_key: [:type_id],
    child_key: [:type_id]

  belongs_to :type_name_ja, 'TrnTranslations',
    parent_key: [ :key_id ],
    child_key: [ :type_id ],
    tc_id: '8',
    language_id: 'JA'

  belongs_to :description_ja, 'TrnTranslations',
    parent_key: [ :key_id ],
    child_key: [ :type_id ],
    tc_id: '33',
    language_id: 'JA'


  def get_type_name
    self.try(:item).try(:type_name)
  end

end
