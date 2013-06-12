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

    #トランザクション開始
    @product_result_item.transaction{

      @product_result_item.each{|item|
        if item.type_id != "" then
          item.relation_id = iid.to_i
          item.type_id = InvTypes.first(:type_name => item.type_id)[:type_id]
          if BluePrintPurchase.first(:type_id => item.type_id) == nil then
            item.sum_price = calctool.calculate_material_cost(item.type_id) * item.use_item_count
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
    result = ProductResult.new(product_result_params)
    @product_result_item = items_params

    #トランザクション開始
    @product_result_item.transaction{
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

      respond_to do |format|
        if @product_result.update(:owner_id => owner_id,
                                  :create_count => create_count,
                                  :sum_price => sum)
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
