#coding : utf-8
class ManagementAccount

 attr_accessor :purchase_amount, :sales_amount, :inventory_amount
 attr_accessor :remain_sales_amount, :product_amount

 attr_accessor :type_id, :type_name, :product_count, :sales_count
 attr_accessor :total_profit, :per_profit, :per_product_profit
 attr_accessor :per_product_amount, :per_sales_amount

  def init_total_account()
    self.purchase_amount = MaterialPurchase.new.get_total_purchase_amounts
    self.purchase_amount += BluePrintPurchase.new.get_total_blueprint_amount
    self.sales_amount = ProductSale.new.get_total_sales_amounts

    #TODO 在庫金額評価実装後に在庫金額を収入にいれる

    self.remain_sales_amount = MarketOrder.new.get_total_amount_market_sell
  end


  def get_detail_account

    results = Array.new
    #アイテム一覧取得
    lists = get_target_item_lists
    lists.each{ |item|
      target = ManagementAccount.new

      #アイテム名
      target.type_name = InvTypes.first(:type_id => item)[:type_name]
      #原料費
      target.product_amount = ProductResult.new.get_total_product_amount(item)
      #生産数
      target.product_count = ProductResult.new.get_total_product_count(item)
      #売上(販売合計金額)
      target.sales_amount = ProductSale.new.get_total_sales_amount(item)
      #売上数(販売数合計)
      target.sales_count = ProductSale.new.get_total_sales_count(item)
      #利益
      target.total_profit = target.sales_amount - target.product_amount
      #1個当たり利益
      target.per_profit =
        target.total_profit / ( (target.product_count + target.sales_count) /2)

      #平均生産原価
      if target.product_count == 0 then
        target.per_product_amount = 0
      else
        target.per_product_amount = target.product_amount / target.product_count
      end
      #平均販売金額
      if target.sales_count == 0 then
        target.per_sales_amount = 0
      else
        target.per_sales_amount = target.sales_amount / target.sales_count
      end
      #1生産当たり利益
      target.per_product_profit = target.per_sales_amount - target.per_product_amount

      results << target
    }

    results
  end

  #詳細表示対象
  def get_target_item_lists
    lists = repository(:default).adapter.select('SELECT distinct typeID FROM ProductResult order by typeID')

    lists
  end
end
