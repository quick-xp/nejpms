#coding : utf-8
require "date"
class ProductSalesController < ApplicationController
  # GET /product_sales
  # GET /product_sales.json
  def index
    @product_sales = ProductSale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_sales }
    end
  end

  # GET /product_sales/1
  # GET /product_sales/1.json
  def show
    @product_sale = ProductSale.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_sale }
    end
  end

  # GET /product_sales/new
  # GET /product_sales/new.json
  def new
    @product_sale = ProductSale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_sale }
    end
  end

  # GET /product_sales/1/edit
  def edit
    @product_sale = ProductSale.get(params[:id])
  end

  # POST /product_sales
  # POST /product_sales.json
  def create
    @product_sale = ProductSale.new(product_sale_params)

    @product_sale.type_id = InvTypes.first(:type_name => @product_sale[:type_id])[:type_id]
    @product_sale.station_id = StaStations.first(:station_name => @product_sale[:station_id])[:station_id]
    @product_sale.transaction_date_time = DateTime.now

    respond_to do |format|
      if @product_sale.save
        format.html { redirect_to @product_sale, notice: 'Product sale was successfully created.' }
        format.json { render json: @product_sale, status: :created, location: @product_sale }
      else
        format.html { render action: "new" }
        format.json { render json: @product_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sales/1
  # PATCH/PUT /product_sales/1.json
  def update
    @product_sale = ProductSale.get(params[:id])
    @product_sale.station_id = StaStations.first(:station_name => params[:product_sale][:station_id])[:station_id]

    respond_to do |format|
      if @product_sale.update(:quantity => params[:product_sale][:quantity],
                             :price => params[:product_sale][:price],
                             :station_id => @product_sale.station_id,
                             :journal_transaction_id => params[:journal_transaction_id],
                             :transaction_date_time => DateTime.now)
        format.html { redirect_to @product_sale, notice: 'Product sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sales/1
  # DELETE /product_sales/1.json
  def destroy
    @product_sale = ProductSale.get(params[:id])
    @product_sale.destroy

    respond_to do |format|
      format.html { redirect_to product_sales_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def product_sale_params
      params.require(:product_sale).permit(:client_id, :journal_transaction_id, :price, :quantity, :station_id, :transaction_id, :type_id)
    end
end
