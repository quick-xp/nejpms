# coding: utf-8

class InventoryTransitionsController < ApplicationController
  def index
    @assets = InventoryTransitions.latest_transitions
  end

  def show
  end
end
