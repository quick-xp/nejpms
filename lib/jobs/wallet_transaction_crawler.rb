# coding: utf-8
require 'net/http'
require 'uri'
require 'xml-object'

# rails runner "Jobs::WalletTransactionCrawler.new.run"
class Jobs::WalletTransactionCrawler
  def run
    begin
      # TODO Load key from config
      keyID="2113292"
      verifyCode ="nv0vGMk45dP3bKy5AfzHyb3iKnGO42d6wnXbdJU4bQ23ujtsEdquLUc6hA5Y8XKT"
      #accountKey="1004"

      list = Array["1000","1001","1002","1003","1004","1005","1006"]
      list.each {|accountKey|
        response = fetch(keyID,verifyCode,accountKey)
        puts response
        persist_wallet_transaction response
      }
    rescue => e
      puts "Wallet Transaction Crawler error occures : " + e.message
    end
  end
  private

  def persist_wallet_transaction(xml)

    puts "insert wallet transaction : transactionID"
    begin
    transactions = xml.result.rowset.row.map do |tran|
      # puts tran.transactionID
      WalletTransactions.new(transactionID: tran.transactionID,
                            transactionDateTime: tran.transactionDateTime,
                            quantity: tran.quantity,
                            typeName: tran.typeName,
                            typeID: tran.typeID,
                            price: tran.price,
                            clientID: tran.clientID,
                            clientName: tran.clientName,
                            stationID: tran.stationID,
                            stationName: tran.stationName,
                            transactionType: tran.transactionType,
                            transactionFor: tran.transactionFor,
                            journalTransactionID: tran.journalTransactionID)
    end
    WalletTransactions.bulk_persist! transactions
    rescue
      puts "skip"
    end
  end

  def fetch(keyID,verifyCode,accountKey)
    # TODO Load uri from config
    uri = URI.parse("https://api.eveonline.com/corp/WalletTransactions.xml.aspx?keyID=#{keyID}&vCode=#{verifyCode}&accountKey=#{accountKey}")

    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = (uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri.path + "?" + uri.query)
    response = http.start {|http| http.request(request) }

    puts "response :"
    puts response
    result = XMLObject.new(response.body)
    puts "response.body analize ok"

    return result
  end
end
