class InventoryClearanceSettingsController < ApplicationController
  # GET /inventory_clearance_settings
  # GET /inventory_clearance_settings.json
  def index
    @inventory_clearance_settings = InventoryClearanceSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_clearance_settings }
    end
  end

  # GET /inventory_clearance_settings/1
  # GET /inventory_clearance_settings/1.json
  def show
    @inventory_clearance_setting = InventoryClearanceSetting.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_clearance_setting }
    end
  end

  # GET /inventory_clearance_settings/new
  # GET /inventory_clearance_settings/new.json
  def new
    @inventory_clearance_setting = InventoryClearanceSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory_clearance_setting }
    end
  end

  # GET /inventory_clearance_settings/1/edit
  def edit
    @inventory_clearance_setting = InventoryClearanceSetting.get(params[:id])
  end

  # POST /inventory_clearance_settings
  # POST /inventory_clearance_settings.json
  def create
    @inventory_clearance_setting = InventoryClearanceSetting.new(inventory_clearance_setting_params)

    respond_to do |format|
      if @inventory_clearance_setting.save
        format.html { redirect_to @inventory_clearance_setting, notice: 'Inventory clearance setting was successfully created.' }
        format.json { render json: @inventory_clearance_setting, status: :created, location: @inventory_clearance_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory_clearance_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_clearance_settings/1
  # PATCH/PUT /inventory_clearance_settings/1.json
  def update
    @inventory_clearance_setting = InventoryClearanceSetting.get(params[:id])

    respond_to do |format|
      if @inventory_clearance_setting.update(inventory_clearance_setting_params)
        format.html { redirect_to @inventory_clearance_setting, notice: 'Inventory clearance setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_clearance_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_clearance_settings/1
  # DELETE /inventory_clearance_settings/1.json
  def destroy
    @inventory_clearance_setting = InventoryClearanceSetting.get(params[:id])
    @inventory_clearance_setting.destroy

    respond_to do |format|
      format.html { redirect_to inventory_clearance_settings_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def inventory_clearance_setting_params
      params.require(:inventory_clearance_setting).permit(:flag_id)
    end
end
