# coding: utf-8

class MaterialShortagesController < ApplicationController
  before_filter :setup_producible_items, only: [:index, :confirm]

  def index
    if session[:station] == nil
      session[:station] = params[:corp_location][:station_id]
    end

    @station_id = session[:station]
    @station_name = StaStations.first(:station_id => @station_id)[:station_name]

    @form = Form::MaterialShortagesForm.new
  end

  def show

    @station_id = session[:station]
    @item = InvTypes.get(params[:id])
    @materials = InvTypeMaterials.all(type_id: @item.type_id)
    @create_count = params[:count].to_i
  end

  def confirm

    @form = Form::MaterialShortagesForm.new(material_shortages_params)
    @form.station_id = session[:station]
    if @form.valid?
      redirect_to material_shortage_path(id: @form.item_id, count: @form.count,station_id: @form.station_id)
    else
      render :index
    end
  end

  # GET /asset_list_masters/select
  # GET /asset_list_masters/select.json
  def select
    @select_stations = CorpLocation.all
    session[:station] = nil
    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end

  def back2
    redirect_to :action => 'index'

  end


  private

  def material_shortages_params
    params.require(:form_material_shortages_form).permit(:item_id, :count, :station_id)
  end

  def setup_producible_items
    @producible_items = InvBlueprintTypes.producible_blueprints.items
  end

end
