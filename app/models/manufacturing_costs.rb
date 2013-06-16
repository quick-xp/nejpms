# coding: utf-8

class ManufacturingCosts
  include Virtus

  attribute :item_id, Integer
  attribute :item_name, String
  attribute :price, Float
  attribute :create_count, String
  attribute :sum_price, Float

  class << self
    def calculate_costs
    end
  end

end
