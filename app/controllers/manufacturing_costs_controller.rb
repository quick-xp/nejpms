# coding: utf-8

class ManufacturingCostsController < ApplicationController

  def index
    @costs = ManufacturingCosts.costs_of_top(3)
  end

end
