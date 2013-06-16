# coding: utf-8

class ManufacturingCostsController < ApplicationController

  def index
    @costs = ManufacturingCosts.costs
  end

end
