# coding: utf-8
require 'net/http'
require 'uri'
require 'xml-object'

# rails runner "Jobs::AssetListCrawler.new.run"
class Jobs::AssetListCrawler
  def run
    #begin
      keyID = Settings.account.key_id
      verifyCode = Settings.account.verify_code

      response = fetch(keyID,verifyCode)
      puts response
      persist_asset_list response
    #rescue => e
    #  puts "Asset List Crawler error occures : " + e.message
    #end
  end
  private

  def persist_asset_list(xml)

    puts "insert asset list : itemID"
    AssetLists.all.destroy

    temp = xml.result.rowset.row
    flg = 0

    begin
      temp.to_ary
    rescue
      flg = 1
    end

    if flg ==0 then
      temp.map do |t|
        puts t.typeID
        if t.typeID == "27" then

          puts t.typeID
          location_id = t.locationID
          transactions = t.rowset.map do |tran|
            AssetLists.new(item_id: tran.itemID,
                           location_id: location_id,
                           quantity: tran.quantity,
                           type_id: tran.typeID,
                           flag: tran.flag)

          end

          AssetLists.bulk_persist! transactions
        end
      end
    else
      t = temp
      puts t.typeID
      if t.typeID == "27" then
        puts t.typeID
        location_id = t.locationID
        transactions = t.rowset.map do |tran|
          AssetLists.new(item_id: tran.itemID,
                         location_id: location_id,
                         quantity: tran.quantity,
                         type_id: tran.typeID,
                         flag: tran.flag)

        end

        AssetLists.bulk_persist! transactions
      end
    end
  end

  def fetch(keyID,verifyCode)
    uri = URI.parse("#{Settings.url.asset_list}?keyID=#{keyID}&vCode=#{verifyCode}")

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
