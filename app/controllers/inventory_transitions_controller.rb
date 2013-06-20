# coding: utf-8

class InventoryTransitionsController < ApplicationController
  def index
    @assets = InventoryTransitions.latest_transitions
  end

  def show
    @transitions = InventoryTransitions.all(order: :add_date.asc).all(type_id: params[:id])
    @asset = InvTypes.all(type_id: params[:id]).first
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.xAxis(categories: @transitions.map { |t| t.add_date.strftime("%Y/%m/%d - %H:%M:%S") })
      f.options[:chart][:defaultSeriesType] = "area"
      f.series(name: '在庫数', data: @transitions.map { |v| v.current_quantity })
    end
  end
end
