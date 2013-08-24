#coding: utf-8
class AccountPayablesController < ApplicationController
  # GET /account_payables
  # GET /account_payables.json
  def index
    @account_payables = AccountPayable.all
    @user_list = UserList.all
    @account_payable = AccountPayable.new
    @account_payable_remain_total = AccountPayable.new.get_not_pay_price_total

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_payables }
    end
  end

  # GET /account_payables/1
  # GET /account_payables/1.json
  def show
    @account_payable = AccountPayable.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_payable }
    end
  end

  def select
    @account_payable = AccountPayable.new
    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end


  # GET /account_payables/new2
  # GET /account_payables/new2.json
  def new2
    user_id = params[:account_payable][:user_id]
    @account_payables = AccountPayable.all(:user_id => user_id,:status => 1) | AccountPayable.all(:user_id => user_id,:status => 3)
    @account_payable = AccountPayable.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_payable }
    end
  end

  # GET /account_payables/1/edit
  def edit
    @account_payable = AccountPayable.get(params[:id])
  end

  def confirm
    checkbox_flags = params[:check]
    @account_payable = AccountPayable.new
    @account_payables = []
    @targets = []
    @sum = 0
    checkbox_flags.each do |check|
      target = AccountPayable.first(:id => check)
      @account_payables << target
      @targets << target[:id]
      @sum += target[:price].to_i
    end

    @targets = @targets.join(",")

    if params[:commit] == "支払い"
      @flag = "支払い"
    else
      @flag = "保留"
    end


    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end


  def ok
    @account_payable = AccountPayable.new
    flag = params[:account_payable][:flag]
    checkbox_flags = params[:account_payable][:check].split(",")

    checkbox_flags.each do |check|
      target = AccountPayable.first(:id => check)

      if flag == "支払い"
        target.update(:status => 2,:operation_date_time => Time.now.utc )#utc
      else
        target.update(:status => 3,:operation_date_time => Time.now.utc )#utc
      end
    end
    respond_to do |format|
      format.html { redirect_to @account_payable, notice: 'Account payable was successfully updated.' }
      # format.json { render json: @product_result }
    end
  end

  # POST /account_payables
  # POST /account_payables.json
  def create
    @account_payable = AccountPayable.new(account_payable_params)

    respond_to do |format|
      if @account_payable.save
        format.html { redirect_to @account_payable, notice: 'Account payable was successfully created.' }
        format.json { render json: @account_payable, status: :created, location: @account_payable }
      else
        format.html { render action: "new" }
        format.json { render json: @account_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /account_payables/1
  # PATCH/PUT /account_payables/1.json
  def update
    @account_payable = AccountPayable.get(params[:id])

    respond_to do |format|
      if @account_payable.update(account_payable_params)
        format.html { redirect_to @account_payable, notice: 'Account payable was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_payable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account_payables/1
  # DELETE /account_payables/1.json
  def destroy
    @account_payable = AccountPayable.get(params[:id])
    @account_payable.destroy

    respond_to do |format|
      format.html { redirect_to account_payables_url }
      format.json { head :no_content }
    end
  end

  private

  # Use this method to whitelist the permissible parameters. Example:
  # params.require(:person).permit(:name, :age)
  # Also, you can specialize this method with per-user checking of permissible attributes.
  def account_payable_params
    params.require(:account_payable).permit(:comment, :operation_date_time, :price, :status, :transaction_date_time, :user_id)
  end
end
