class UserListsController < ApplicationController
  # GET /user_lists
  # GET /user_lists.json
  def index
    @user_lists = UserList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_lists }
    end
  end

  # GET /user_lists/1
  # GET /user_lists/1.json
  def show
    @user_list = UserList.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_list }
    end
  end

  # GET /user_lists/new
  # GET /user_lists/new.json
  def new
    @user_list = UserList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_list }
    end
  end

  # GET /user_lists/1/edit
  def edit
    @user_list = UserList.get(params[:id])
  end

  # POST /user_lists
  # POST /user_lists.json
  def create
    @user_list = UserList.new(user_list_params)

    respond_to do |format|
      if @user_list.save
        format.html { redirect_to @user_list, notice: 'User list was successfully created.' }
        format.json { render json: @user_list, status: :created, location: @user_list }
      else
        format.html { render action: "new" }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_lists/1
  # PATCH/PUT /user_lists/1.json
  def update
    @user_list = UserList.get(params[:id])

    respond_to do |format|
      if @user_list.update(user_list_params)
        format.html { redirect_to @user_list, notice: 'User list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_lists/1
  # DELETE /user_lists/1.json
  def destroy
    @user_list = UserList.get(params[:id])
    @user_list.destroy

    respond_to do |format|
      format.html { redirect_to user_lists_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def user_list_params
      params.require(:user_list).permit(:user_id, :user_name)
    end
end
