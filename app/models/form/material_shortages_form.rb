# coding: utf-8

class Form::MaterialShortagesForm
  include ActiveModel::Translation
  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming
  include Virtus

  validates_presence_of :item_id
  validates_presence_of :count
  validates_presence_of :station_id
  validates :count, :numericality => { greater_than_or_equal_to: 0 }

  def persisted?; false; end

  attribute :item_id, Integer
  attribute :count, Integer
  attribute :station_id, Integer
end
