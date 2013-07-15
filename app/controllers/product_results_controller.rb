#coding: utf-8
class ProductResultsController < ApplicationController
  # GET /product_results
  # GET /product_results.json
  def index
    @product_results = ProductResult.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_results }
    end
  end

  # GET /product_results/1
  # GET /product_results/1.json
  def show
    @product_result = ProductResult.get(params[:id])
    @product_result_item = items_shows(@product_result)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_result }
    end
  end

  # GET /product_results/new
  # GET /product_results/new.json
  def new
    @product_result = ProductResult.new
    @product_result_item =10.times.map{ ProductResultItem.new }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_result }
    end
  end

  # POST /product_results/new2
  # POST /product_results/new2.json
  def new2
    @product_result = ProductResult.new
    @product_result_item =10.times.map{ ProductResultItem.new }

    type_id = params[:product_result][:type_id]

    @product_result.type_id = type_id

    type_id = InvTypes.first(:type_name => type_id)[:type_id]
    material_items = InvTypeMaterials.all(:type_id => type_id)

    @product_result_item[0][:type_id] = params[:product_result][:type_id] + " Blueprint"
    material_items.each_with_index{|material,i|
      @product_result_item[i+1][:type_id] = InvTypes.first(:type_id => material.material_type_id)[:type_name]
    }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_result }
    end
  end


  # GET /product_results/select
  # GET /product_results/select.json
  def select
    @product_result = ProductResult.new
    @producible_items = InvBlueprintTypes.producible_blueprints.items
    respond_to do |format|
      format.html # select.html.erb
      # format.json { render json: @product_result }
    end
  end

  # GET /product_results/1/edit
  def edit
    @product_result = ProductResult.get(params[:id])
    @product_result_item = items_shows(@product_result)
  end

  # POST /product_results
  # POST /product_results.json
  def create
    @product_result = ProductResult.new(product_result_params)
    @product_result_item = items_params

    calctool = Cost.new
    #使用アイテム登録
    iid = Time.now.strftime("%m%d%H%M%S").to_i
    sum = 0
    type_name = @product_result.type_id

    #トランザクション開始
    ProductResult.transaction{

      @product_result_item.each{|item|
        if item.type_id != "" then
          item.relation_id = iid.to_i
          item.type_id = InvTypes.first(:type_name => item.type_id)[:type_id]
          if BluePrintPurchase.first(:type_id => item.type_id) == nil then
            item.sum_price = calctool.calculate_material_cost(item.type_id) * item.use_item_count

            #在庫反映待ちへの登録
            owner =UserList.first(:user_id => @product_result.owner_id)[:user_name]
            AssetListsComp.new(:type_id => item.type_id,
                               :quantity => - item.use_item_count,
                               :station_id => 60003862, #TODO
                               :sync_flag => 0,
                               :comment => "生産 :" + type_name + " ,生産数 : " + @product_result.create_count.to_s +
                               " ,owner : " + owner,
                               :sync_type => 1,#生産実績
                               :sync_id => iid,
                               :add_date => Time.now.utc).save

          else
            item.sum_price = calctool.calculate_blueprint_cost(item.type_id) * item.use_item_count
          end
          sum += item.sum_price
          item.save
        end
      }

      # 実績登録
      @product_result.id = iid
      @product_result.type_id = InvTypes.first(:type_name => @product_result.type_id)[:type_id]

      @product_result.sum_price = sum

      @product_result.transaction_date_time = Time.now.utc
      #在庫反映待ちへの登録
      owner =UserList.first(:user_id => @product_result.owner_id)[:user_name]
      AssetListsComp.new(:type_id => @product_result.type_id,
                         :quantity => @product_result.create_count,
                         :station_id => 60003862, #TODO
                         :sync_flag => 0,
                         :comment => "生産 :" + type_name + " ,生産数 : " + @product_result.create_count.to_s +
                         " ,owner : " + owner,
                         :sync_type => 1,#生産実績
                         :sync_id => iid,
                         :add_date => @product_result.transaction_date_time).save

      respond_to do |format|
        if @product_result.save
          format.html { redirect_to @product_result, notice: 'Product result was successfully created.' }
          format.json { render json: @product_result, status: :created, location: @product_result }
        else
          format.html { render action: "new" }
          format.json { render json: @product_result.errors, status: :unprocessable_entity }
        end
      end
    }
  end

  # PATCH/PUT /product_results/1
  # PATCH/PUT /product_results/1.json
  def update
    @product_result = ProductResult.get(params[:id])
    @product_result_item = items_params

    #トランザクション開始
    ProductResult.transaction{
      calctool = Cost.new
      ProductResultItem.all(:relation_id => params[:id]).map {|item|
        item.destroy
      }
      sum = 0

      #使用アイテム登録
      @product_result_item.each{|item|
        if item.type_id != "" then
          item.relation_id = params[:id]
          item.type_id = InvTypes.first(:type_name => item.type_id)[:type_id]
          if BluePrintPurchase.first(:type_id => item.type_id) == nil then
            item.sum_price = calctool.calculate_material_cost(item.type_id) * item.use_item_count

            #在庫反映待ちへの登録
            owner =UserList.first(:user_id => @product_result.owner_id)[:user_name]
            type_name = InvTypes.first(:type_id => @product_result.type_id)[:type_name]
            w = AssetListsComp.first(:sync_type => 1,:sync_id => params[:id],:type_id => item.type_id)
            puts "反映待ち"
            puts item.type_id.to_s
            puts "----"
            if w != nil
              puts "反映待ち登録 実行"
              puts item.use_item_count.to_s
              puts "登録end----"
              owner =UserList.first(:user_id => @product_result.owner_id)[:user_name]
              w.update( :quantity => - item.use_item_count,
                       :station_id => 60003862, #TODO
                       :comment => "生産 :" + type_name + " ,生産数 : " + @product_result.create_count.to_s +
                       " ,owner : " + owner,
                       :add_date => Time.now.utc)
            end
          else
            item.sum_price = calctool.calculate_blueprint_cost(item.type_id) * item.use_item_count
          end
          sum += item.sum_price
          item.save
        end
      }

      # 実績登録
      # @product_result.sum_price = sum
      owner_id = params[:product_result][:owner_id]
      create_count = params[:product_result][:create_count]

      #在庫反映待ちへの登録
      type_name = InvTypes.first(:type_id => @product_result.type_id)[:type_name]
      w = AssetListsComp.first(:sync_type => 1,:sync_id => params[:id],:type_id => @product_result.type_id)
      if w != nil
        owner =UserList.first(:user_id => @product_result.owner_id)[:user_name]
        w.update( :quantity => @product_result.create_count,
                 :station_id => 60003862, #TODO
                 :comment => "生産 :" + type_name + " ,生産数 : " + @product_result.create_count.to_s +
                 " ,owner : " + owner,
                 :add_date => Time.now.utc)

      end

      respond_to do |format|
        if @product_result.update(:owner_id => owner_id,
                                  :create_count => create_count,
                                  :sum_price => sum,
                                  :transaction_date_time => Time.now.utc)
          format.html { redirect_to @product_result, notice: 'Product result was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @product_result.errors, status: :unprocessable_entity }
        end
      end
    }
  end

  # DELETE /product_results/1
  # DELETE /product_results/1.json
  def destroy
    @product_result = ProductResult.get(params[:id])
    @product_result.destroy

    #在庫反映待ちへの登録
    w = AssetListsComp.all(:sync_type => 1,:sync_id => params[:id])
    if w != nil then
      w.all.destroy
    end

    respond_to do |format|
      format.html { redirect_to product_results_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def product_result_params
      params.require(:product_result).permit(:create_count, :owner_id, :sum_price, :type_id)
    end

    def items_shows(item_information)
      item = ProductResultItem.all(:relation_id => item_information.id)
      puts item
      result = []
      for i in 0..9 do
        if item[i] != nil then
          result[i]=  item[i]
          puts result[i][:type_id]
        else
          result[i] = ProductResultItem.new
        end

      end
      return result
    end

    def items_params
      item_temp = params[:product_result_item]
      product_result_item = []
      item_temp.each_with_index {|item,i|
        product_result_item <<
          ProductResultItem.new(type_id: item[1][:type_id],
                              use_item_count: item[1][:use_item_count])
      }

      return product_result_item
    end

end
