class AssetListsController < ApplicationController
  # GET /asset_lists
  # GET /asset_lists.json
  def index
    @asset_lists = AssetLists.all(:order => [ :type_id.asc])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @asset_lists }
    end
  end

  # GET /asset_lists/1
  # GET /asset_lists/1.json
  def show
    @asset_list = AssetLists.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset_list }
    end
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

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def asset_list_params
    params.require(:asset_list).permit(:flag, :item_id, :location_id, :quantity, :type_id)
  end
end
