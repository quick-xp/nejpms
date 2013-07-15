#coding: utf-8
class InventoryClearancesController < ApplicationController
  # GET /inventory_clearances
  # GET /inventory_clearances.json
  def index
    @inventory_clearances = InventoryClearance.new.get_assets_lists(60003862)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_clearances }
    end
  end

  # GET /inventory_clearances/select
  # GET /inventory_clearances/select.json
  def select
    @asset_list_masters = AssetListMaster.new
    @select_stations = CorpLocation.all
    session[:station] = nil
    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end


  # COMMIT /inventory_clearances
  # COMMIT /inventory_clearances
  def create

    if params[:commit] != "同期開始"
      Jobs::WalletTransactionCrawler.new.run
      Jobs::MaterialPurchaseCrawler.new.run
      Jobs::ProductSalesCrawler.new.run
      Jobs::AssetListCrawler.new.run
      Jobs::MarketOrderCrawler.new.run
      Jobs::WalletJournalCrawler.new.run
      message = "同期前在庫即時関連バッチが完了しました"
    else
      message = "在庫を同期しました"
    end

    respond_to do |format|
      format.html { redirect_to inventory_clearances_url ,notice: message}
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def inventory_clearance_params
      params.require(:inventory_clearance).permit(:current_quantity, :current_sync_quantity, :new_quantity, :type_id, :type_name)
    end
end
