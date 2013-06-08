#coding: utf-8
class BluePrintPurchasesController < ApplicationController
  # GET /blue_print_purchases
  # GET /blue_print_purchases.json
  def index
    @blue_print_purchases = BluePrintPurchase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blue_print_purchases }
    end
  end

  # GET /blue_print_purchases/1
  # GET /blue_print_purchases/1.json
  def show
    @blue_print_purchase = BluePrintPurchase.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blue_print_purchase }
    end
  end

  # GET /blue_print_purchases/new
  # GET /blue_print_purchases/new.json
  def new
    @blue_print_purchase = BluePrintPurchase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blue_print_purchase }
    end
  end

  # GET /blue_print_purchases/1/edit
  def edit
    @blue_print_purchase = BluePrintPurchase.get(params[:id])
  end

  # POST /blue_print_purchases
  # POST /blue_print_purchases.json
  def create
    @blue_print_purchase = BluePrintPurchase.new(blue_print_purchase_params)

    #TODO : 名前チェック

    @blue_print_purchase.type_id = InvTypes.first(:type_name => @blue_print_purchase[:type_id])[:type_id]

    respond_to do |format|
      if @blue_print_purchase.save
        format.html { redirect_to @blue_print_purchase, notice: 'Blue print purchase was successfully created.' }
        format.json { render json: @blue_print_purchase, status: :created, location: @blue_print_purchase }
      else
        format.html { render action: "new" }
        format.json { render json: @blue_print_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blue_print_purchases/1
  # PATCH/PUT /blue_print_purchases/1.json
  def update
    @blue_print_purchase = BluePrintPurchase.get(params[:id])

    respond_to do |format|
      if @blue_print_purchase.update(:use_count => params[:blue_print_purchase][:use_count],
                                    :price => params[:blue_print_purchase][:price],
                                    :comment => params[:blue_print_purchase][:comment])
        format.html { redirect_to @blue_print_purchase, notice: 'Blue print purchase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blue_print_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blue_print_purchases/1
  # DELETE /blue_print_purchases/1.json
  def destroy
    @blue_print_purchase = BluePrintPurchase.get(params[:id])
    @blue_print_purchase.destroy

    respond_to do |format|
      format.html { redirect_to blue_print_purchases_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def blue_print_purchase_params
      params.require(:blue_print_purchase).permit(:comment, :price, :type_id, :use_count)
    end
end
