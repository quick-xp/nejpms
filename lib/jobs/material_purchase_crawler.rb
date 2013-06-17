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
            m.save

            puts "transaction_id " + m.transaction_id.to_s + " save"
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
