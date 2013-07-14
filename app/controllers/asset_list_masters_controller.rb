class AssetListMastersController < ApplicationController
  # GET /asset_list_masters
  # GET /asset_list_masters.json
  def index

    station_id = params[:asset_list_master][:station_id]
    @asset_list_masters = AssetListMaster.all(:station_id => station_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_list_masters }
    end
  end

  # GET /asset_list_masters/select
  # GET /asset_list_masters/select.json
  def select
    @asset_list_masters = AssetListMaster.new
    @select_stations = CorpLocation.all
    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end

  def back2
    redirect_to :action => 'index',params => {:station_id => 11}

  end

  # GET /asset_list_masters/1
  # GET /asset_list_masters/1.json
  def show
    @asset_list_master = AssetListMaster.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_list_master }
    end
  end

  # GET /asset_list_masters/1
  # GET /asset_list_masters/1.json
  def tran_show
    @asset_list_master = AssetListMaster.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_list_master }
    end
  end


  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def asset_list_master_params
      params.require(:asset_list_master).permit(:quantity, :type_id)
    end
end
