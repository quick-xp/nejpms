#coding: utf-8
class StoringsController < ApplicationController
  # GET /storings
  # GET /storings.json
  def index
    @storings = Storing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storings }
    end
  end

  # GET /storings/1
  # GET /storings/1.json
  def show
    @storing = Storing.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storing }
    end
  end

  # GET /storings/new
  # GET /storings/new.json
  def new
    @storing = Storing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storing }
    end
  end

  # GET /storings/1/edit
  def edit
    @storing = Storing.get(params[:id])
  end

  # POST /storings
  # POST /storings.json
  def create
    @storing = Storing.new(storing_params)

    @storing.type_id = InvTypes.first(:type_name => @storing[:type_id])[:type_id]
    @storing.station_id = params[:storing][:station_id]
    @storing.add_date = Time.now.utc #utc

    respond_to do |format|
      if @storing.save
        #在庫反映待ちへの登録
        AssetListsComp.new(:type_id => @storing.type_id,
                           :quantity => @storing.quantity,
                           :station_id => @storing.station_id,
                           :sync_flag => 0,
                           :comment => "原料入庫",
                           :sync_type => 0,
                           :sync_id => @storing.id,
                           :add_date => @storing.add_date).save

        format.html { redirect_to @storing, notice: 'Storing was successfully created.' }
        format.json { render json: @storing, status: :created, location: @storing }
      else
        format.html { render action: "new" }
        format.json { render json: @storing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storings/1
  # PATCH/PUT /storings/1.json
  def update
    @storing = Storing.get(params[:id])

    station_id = params[:storing][:station_id]
    add_date = Time.now.utc #utc

    respond_to do |format|
      if @storing.update(:quantity => params[:storing][:quantity],
                        :station_id => station_id,
                        :add_date => add_date)
        #在庫反映待ちへの登録
        w = AssetListsComp.first(:sync_type => 0,:sync_id => params[:id])
        if w != nil
          w.update( :quantity => @storing.quantity,
                   :station_id => @storing.station_id,
                   :comment => "原料入庫",
                   :add_date => add_date)
        end

        format.html { redirect_to @storing, notice: 'Storing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @storing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storings/1
  # DELETE /storings/1.json
  def destroy
    @storing = Storing.get(params[:id])
    @storing.destroy

    #在庫反映待ちへの登録
    w = AssetListsComp.first(:sync_type => 0,:sync_id => params[:id])
    if w != nil then
      w.destroy
    end

    respond_to do |format|
      format.html { redirect_to storings_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def storing_params
      params.require(:storing).permit(:quantity, :station_id, :type_id)
    end
end
