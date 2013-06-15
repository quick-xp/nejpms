# coding: utf-8

class AssetListsController < ApplicationController

  def index
    @asset_lists = AssetLists.all(:order => [ :type_id.asc])
  end

  def show
    @asset_list = AssetLists.get(params[:id])
  end

  def search
    @asset_lists = if params[:s_type] != ""
                     AssetLists.all(:type_id => "#{InvTypes.first(:type_name.like => "%#{params[:s_type]}%")[:type_id]}")
                   elsif params[:s_flag] != ""
                     AssetLists.all(:flag => "#{params[:s_flag]}" ,:order => [:type_id.asc])
                   else
                     AssetLists.all
                   end
    render :action => 'index'
  end

  private

  def asset_list_params
    params.require(:asset_list).permit(:flag, :item_id, :location_id, :quantity, :type_id)
  end
end
