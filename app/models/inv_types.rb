# coding: utf-8

class InvTypes
  include DataMapper::Resource

  storage_names[:default] = 'invTypes'

  property :type_id, Serial, field: 'typeID', required: true, key: true
  property :group_id, Integer, field: 'groupID'
  property :type_name, String, field: 'typeName', length: 11
  property :description, String, field: 'description', length: 3000
  property :mass, Float, field: 'mass'
  property :volume, Float, field: 'volume'
  property :capacity, Float, field: 'capacity'
  property :portion_size, Integer, field: 'portionSize'
  property :race_id, Integer, field: 'raceID'
  property :basePrice, Decimal, field: 'basePrice'
  property :published, Integer, field: 'published'
  property :market_group_id, Integer, field: 'marketGroupID'
  property :chance_of_duplicating, Float, field: 'chanceOfduplicating'

  belongs_to :type_name_ja, 'TrnTranslations',
    parent_key: [ :key_id ],
    child_key: [ :type_id ],
    tc_id: '8',
    language_id: 'JA'

end
