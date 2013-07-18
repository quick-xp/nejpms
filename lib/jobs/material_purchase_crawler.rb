# coding: utf-8

# rails runner "Jobs::MaterialPurchaseCrawler.new.run"
class Jobs::MaterialPurchaseCrawler
  def run
    begin
      wallet_transactions = WalletTransactions.all
      puts "start MetarialPurchaseCrawler"

      wallet_transactions.map {|transaction|
        if transaction[:transactionType] == "buy" then
          if MaterialPurchase.first(:transaction_id => transaction[:transactionID]) == nil then
            m = MaterialPurchase.new
            m.transaction_id = transaction[:transactionID]
            m.quantity = transaction[:quantity]
            m.type_id = transaction[:typeID]
            m.price = transaction[:price]
            m.station_id = transaction[:stationID]
            m.transaction_date_time = transaction[:transactionDateTime]
            m.save

            puts "transaction_id " + m.transaction_id.to_s + " save"

            #ロケーション設定がなされている場合は在庫に反映する
            if CorpLocation.first(:station_id => transaction[:stationID]) != nil then
              #在庫反映待ちへの登録
              AssetListsComp.new(:type_id => transaction[:typeID],
                                 :quantity => transaction[:quantity],
                                 :station_id => transaction[:stationID] ,
                                 :sync_flag => 0,
                                 :comment => "原料仕入れ ,価格 :" + transaction[:price].to_s,
                                 :sync_type => 0,#原料仕入れ
                                 :sync_id => transaction[:transactionID],
                                 :add_date => transaction[:transactionDateTime]).save
            end

          else
            puts "transaction_id" + transaction.transactionID.to_s + " is already saved"
          end
        end
      }
    rescue => e
      puts "Material Purchase Crawler error occures : " + e.message
    end

    puts "end MetarialPurchaseCrawler"
  end

end
