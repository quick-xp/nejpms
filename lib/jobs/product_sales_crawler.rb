# coding: utf-8

# rails runner "Jobs::ProductSalesCrawler.new.run"
class Jobs::ProductSalesCrawler
  def run
    begin
      wallet_transactions = WalletTransactions.all
      puts "start MetarialPurchaseCrawler"

      wallet_transactions.map {|transaction|
        if transaction[:transactionType] == "sell" then
          if ProductSale.first(:transaction_id => transaction[:transactionID]) == nil then
            m = ProductSale.new
            m.transaction_id = transaction[:transactionID]
            m.transaction_date_time=transaction[:transactionDateTime]
            m.quantity = transaction[:quantity]
            m.type_id = transaction[:typeID]
            m.price = transaction[:price]
            m.client_id = transaction[:clientID]
            m.station_id = transaction[:stationID]
            m.journal_transaction_id = transaction[:journalTransactionID]
            m.save

            puts "transaction_id " + m.transaction_id.to_s + " save"
          else
            puts "transaction_id" + transaction.transactionID.to_s + " is already saved"
          end
        end
      }
    rescue => e
      puts "Product Sales Crawler error occures : " + e.message
    end

    puts "end ProductSalesCrawler"
  end

end
