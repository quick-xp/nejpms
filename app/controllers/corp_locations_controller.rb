class CorpLocationsController < ApplicationController
  # GET /corp_locations
  # GET /corp_locations.json
  def index
    @corp_locations = CorpLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corp_locations }
    end
  end

  # GET /corp_locations/1
  # GET /corp_locations/1.json
  def show
    @corp_location = CorpLocation.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corp_location }
    end
  end

  # GET /corp_locations/new
  # GET /corp_locations/new.json
  def new
    @corp_location = CorpLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corp_location }
    end
  end

  # GET /corp_locations/1/edit
  def edit
    @corp_location = CorpLocation.get(params[:id])
  end

  # POST /corp_locations
  # POST /corp_locations.json
  def create
    @corp_location = CorpLocation.new(corp_location_params)

    respond_to do |format|
      if @corp_location.save
        format.html { redirect_to @corp_location, notice: 'Corp location was successfully created.' }
        format.json { render json: @corp_location, status: :created, location: @corp_location }
      else
        format.html { render action: "new" }
        format.json { render json: @corp_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corp_locations/1
  # PATCH/PUT /corp_locations/1.json
  def update
    @corp_location = CorpLocation.get(params[:id])

    respond_to do |format|
      if @corp_location.update(corp_location_params)
        format.html { redirect_to @corp_location, notice: 'Corp location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corp_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corp_locations/1
  # DELETE /corp_locations/1.json
  def destroy
    @corp_location = CorpLocation.get(params[:id])
    @corp_location.destroy

    respond_to do |format|
      format.html { redirect_to corp_locations_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def corp_location_params
      params.require(:corp_location).permit(:station_id, :station_name)
    end
end
