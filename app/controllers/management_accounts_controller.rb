class ManagementAccountsController < ApplicationController
  # GET /management_accounts
  # GET /management_accounts.json
  def index
    @management_account = ManagementAccount.new
    @management_account.init_total_account()

    @detail_lists = @management_account.get_detail_account
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @management_account }
    end
  end

  # GET /management_accounts/1
  # GET /management_accounts/1.json
  def show
    @management_account = ManagementAccount.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @management_account }
    end
  end

  # GET /management_accounts/new
  # GET /management_accounts/new.json
  def new
    @management_account = ManagementAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @management_account }
    end
  end

  # GET /management_accounts/1/edit
  def edit
    @management_account = ManagementAccount.get(params[:id])
  end

  # POST /management_accounts
  # POST /management_accounts.json
  def create
    @management_account = ManagementAccount.new(management_account_params)

    respond_to do |format|
      if @management_account.save
        format.html { redirect_to @management_account, notice: 'Management account was successfully created.' }
        format.json { render json: @management_account, status: :created, location: @management_account }
      else
        format.html { render action: "new" }
        format.json { render json: @management_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /management_accounts/1
  # PATCH/PUT /management_accounts/1.json
  def update
    @management_account = ManagementAccount.get(params[:id])

    respond_to do |format|
      if @management_account.update(management_account_params)
        format.html { redirect_to @management_account, notice: 'Management account was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @management_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /management_accounts/1
  # DELETE /management_accounts/1.json
  def destroy
    @management_account = ManagementAccount.get(params[:id])
    @management_account.destroy

    respond_to do |format|
      format.html { redirect_to management_accounts_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def management_account_params
      params.require(:management_account).permit(:inventory_amount, :purchase_amount, :sales_amount)
    end
end
