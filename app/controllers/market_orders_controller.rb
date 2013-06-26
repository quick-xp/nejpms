#coding : utf-8
class MarketOrdersController < ApplicationController
  # GET /market_orders
  # GET /market_orders.json
  def index
    @market_orders = MarketOrder.all(:order_state => 0,:bid => false)
    @market_orders_buy = MarketOrder.all(:order_state => 0,:bid => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @market_orders }
    end
  end

  # GET /market_orders/1
  # GET /market_orders/1.json
  def show
    @market_order = MarketOrder.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @market_order }
    end
  end

  # GET /market_orders/new
  # GET /market_orders/new.json
  def new
    @market_order = MarketOrder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @market_order }
    end
  end

  # GET /market_orders/1/edit
  def edit
    @market_order = MarketOrder.get(params[:id])
  end

  # POST /market_orders
  # POST /market_orders.json
  def create
    @market_order = MarketOrder.new(market_order_params)

    respond_to do |format|
      if @market_order.save
        format.html { redirect_to @market_order, notice: 'Market order was successfully created.' }
        format.json { render json: @market_order, status: :created, location: @market_order }
      else
        format.html { render action: "new" }
        format.json { render json: @market_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /market_orders/1
  # PATCH/PUT /market_orders/1.json
  def update
    @market_order = MarketOrder.get(params[:id])

    respond_to do |format|
      if @market_order.update(market_order_params)
        format.html { redirect_to @market_order, notice: 'Market order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @market_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /market_orders/1
  # DELETE /market_orders/1.json
  def destroy
    @market_order = MarketOrder.get(params[:id])
    @market_order.destroy

    respond_to do |format|
      format.html { redirect_to market_orders_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def market_order_params
      params.require(:market_order).permit(:account_key, :bid, :char_id, :duration, :escrow, :issue, :min_volume, :order_id, :order_state, :order_state, :price, :range, :station_id, :type_id, :vol_entered, :vol_remaining)
    end
end
