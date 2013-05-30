#coding: utf-8
class MaterialPurchasesController < ApplicationController
  # GET /material_purchases
  # GET /material_purchases.json
  def index
    @material_purchases = MaterialPurchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_purchases }
    end
  end

  # GET /material_purchases/1
  # GET /material_purchases/1.json
  def show
    @material_purchase = MaterialPurchase.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_purchase }
    end
  end

  # GET /material_purchases/new
  # GET /material_purchases/new.json
  def new
    @material_purchase = MaterialPurchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_purchase }
    end
  end

  # GET /material_purchases/1/edit
  def edit
    @material_purchase = MaterialPurchase.get(params[:id])
  end

  # POST /material_purchases
  # POST /material_purchases.json
  def create
    @material_purchase = MaterialPurchase.new(material_purchase_params)

    #TODO : 名前チェック

    @material_purchase.type_id = InvTypes.first(:type_name => @material_purchase[:type_id])[:type_id]
    @material_purchase.station_id = StaStations.first(:station_name => @material_purchase[:station_id])[:station_id]

    respond_to do |format|
      if @material_purchase.save
        format.html { redirect_to @material_purchase, notice: 'Material purchase was successfully created.' }
        format.json { render json: @material_purchase, status: :created, location: @material_purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @material_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_purchases/1
  # PATCH/PUT /material_purchases/1.json
  def update
    @material_purchase = MaterialPurchase.get(params[:id])
    puts  params[:material_purchase][:type_id]
    #@material_purchase.type_id = InvTypes.first(:type_name => params[:material_purchase][:type_id])[:type_id]
    @material_purchase.station_id = StaStations.first(:station_name => params[:material_purchase][:station_id])[:station_id]

    respond_to do |format|
      if @material_purchase.update(:quantity => params[:material_purchase][:quantity],
                                  :price => params[:material_purchase][:price],
                                  :station_id => @material_purchase.station_id)

        format.html { redirect_to @material_purchase, notice: 'Material purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_purchases/1
  # DELETE /material_purchases/1.json
  def destroy
    @material_purchase = MaterialPurchase.get(params[:id])
    @material_purchase.destroy

    respond_to do |format|
      format.html { redirect_to material_purchases_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def material_purchase_params
      params.require(:material_purchase).permit(:price, :quantity, :station_id, :transaction_id, :type_id)
    end
end
