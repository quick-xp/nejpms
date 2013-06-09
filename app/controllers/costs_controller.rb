class CostsController < ApplicationController
  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costs }
    end
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
    @cost = Cost.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cost }
    end
  end

  # GET /costs/new
  # GET /costs/new.json
  def new
    @cost = Cost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cost }
    end
  end

  # GET /costs/1/edit
  def edit
    @cost = Cost.get(params[:id])
  end

  # POST /costs
  # POST /costs.json
  def create
    @cost = Cost.new(cost_params)

    respond_to do |format|
      if @cost.save
        format.html { redirect_to @cost, notice: 'Cost was successfully created.' }
        format.json { render json: @cost, status: :created, location: @cost }
      else
        format.html { render action: "new" }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    @cost = Cost.get(params[:id])

    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost = Cost.get(params[:id])
    @cost.destroy

    respond_to do |format|
      format.html { redirect_to costs_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def cost_params
      params.require(:cost).permit(:per_price, :type, :type_id)
    end
end
