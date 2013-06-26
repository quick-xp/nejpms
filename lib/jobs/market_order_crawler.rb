# coding: utf-8
require 'net/http'
require 'uri'
require 'xml-object'

# rails runner "Jobs::MarketOrderCrawler.new.run"
class Jobs::MarketOrderCrawler
  def run
    begin
      puts "start MarketOrderCrawler"
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
      puts "MarketOrderCrawler error occures : " + e.message
    end
  end
  private

  def persist_wallet_transaction(xml)

    puts "insert MarketOrder : orderID"
    begin
      transactions = xml.result.rowset.row.map do |tran|
        # puts tran.transactionID
        MarketOrder.new(
          order_id: tran.orderID,
          char_id: tran.charID,
          station_id: tran.stationID,
          vol_entered: tran.volEntered,
          vol_remaining: tran.volRemaining,
          min_volume: tran.minVolume,
          order_state: tran.orderState,
          type_id: tran.typeID,
          range: tran.range,
          account_key: tran.accountKey,
          duration: tran.duration,
          escrow: tran.escrow,
          price: tran.price,
          bid: tran.bid,
          issue: tran.issued
        )

    end
    MarketOrder.bulk_persist! transactions
    rescue => e
      puts "skip"
      p e.backtrace
    end
  end

  def fetch(keyID,verifyCode,accountKey)
    # TODO Load uri from config
    uri = URI.parse("https://api.eveonline.com/corp/MarketOrders.xml.aspx?keyID=#{keyID}&vCode=#{verifyCode}&accountKey=#{accountKey}")

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
