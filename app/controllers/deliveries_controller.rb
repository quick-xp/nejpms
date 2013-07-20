#coding: utf-8
class DeliveriesController < ApplicationController
  # GET /deliveries
  # GET /deliveries.json
  def index
    if session[:station] == nil
      session[:station] = params[:corp_location][:station_id]
    end

    @station_id = session[:station]
    @station_name = StaStations.first(:station_id => @station_id)[:station_name]

    @deliveries = Delivery.all(:station_id => @station_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliveries }
    end
  end

  # GET /deliveries/select
  # GET /deliveries/select.json
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


  # GET /deliveries/1
  # GET /deliveries/1.json
  def show
    @delivery = Delivery.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery }
    end
  end

  # GET /deliveries/new
  # GET /deliveries/new.json
  def new
    @station_id = session[:station]
    @station_name = StaStations.first(:station_id => @station_id)[:station_name]

    @delivery = Delivery.new

    if params[:type_id] != nil then
      @delivery.type_id = params[:type_id]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery }
    end
  end

  # GET /deliveries/1/edit
  def edit
    @station_id = session[:station]
    @station_name = StaStations.first(:station_id => @station_id)[:station_name]

    @delivery = Delivery.get(params[:id])
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    @delivery = Delivery.new(delivery_params)

    @delivery.type_id = InvTypes.first(:type_name => @delivery[:type_id])[:type_id]
    @delivery.station_id = session[:station]
    @delivery.add_date = Time.now.utc #utc

    respond_to do |format|
      if @delivery.save
        #在庫反映待ちへの登録
        AssetListsComp.new(:type_id => @delivery.type_id,
                           :quantity =>  -(@delivery.quantity.to_i),
                           :station_id => @delivery.station_id,
                           :sync_flag => 0,
                           :comment => "出庫",
                           :sync_type => 2,
                           :sync_id => @delivery.id,
                           :add_date => @delivery.add_date).save

        format.html { redirect_to @delivery, notice: 'Delivery was successfully created.' }
        format.json { render json: @delivery, status: :created, location: @delivery }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliveries/1
  # PATCH/PUT /deliveries/1.json
  def update
    @delivery = Delivery.get(params[:id])

    add_date = Time.now.utc #utc

    respond_to do |format|
      if @delivery.update(:quantity => params[:delivery][:quantity],
                         :add_date => add_date)
        #在庫反映待ちへの登録
        w = AssetListsComp.first(:sync_type => 2,:sync_id => params[:id])
        if w != nil
          w.update( :quantity => -(params[:delivery][:quantity].to_i),
                   :add_date => add_date)
        end

        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery = Delivery.get(params[:id])
    @delivery.destroy

    #在庫反映待ちへの登録
    w = AssetListsComp.first(:sync_type => 2,:sync_id => params[:id])
    if w != nil then
      w.destroy
    end

    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def delivery_params
      params.require(:delivery).permit( :quantity, :station_id, :type_id)
    end
end
