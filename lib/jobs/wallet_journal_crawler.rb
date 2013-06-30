# coding: utf-8
require 'net/http'
require 'uri'
require 'xml-object'

# rails runner "Jobs::WalletJournalCrawler.new.run"
class Jobs::WalletJournalCrawler
  def run
    account_keys = ["1000","1001","1002","1003","1004","1005","1006"]
    account_keys.each do |key|
      xml = fetch(key)
      persist_wallet_journal(xml)
    end
  end

  private

  def persist_wallet_journal(xml)
    puts 'insert wallet journal'
    begin
      journals = xml
        .result
        .rowset
        .row
        .map { |tran|
          WalletJournal.new(
            transaction_id: tran.refID,
            transaction_date_time: tran.date,
            transaction_type_id: tran.refTypeID,
            owner_name1: tran.ownerName1,
            owner_id1: tran.ownerID1,
            owner_name2: tran.ownerName2,
            owner_id2: tran.ownerID2,
            arg_name1: tran.argName1,
            arg_id1: tran.argID1,
            amount: tran.amount,
            balance: tran.balance,
            reason: tran.reason,
            tax_receiver_id: (tran.taxReceiverID rescue nil),
            tax_amount: (tran.taxAmount rescue nil)
          )
        }
      bulk_persist(journals)
    rescue => e
      puts "invalid wallet journal transaction. skip"
      p e.backtrace
    end
  end

  def fetch(account_key)
    key_id = Settings.account.key_id
    verify_code = Settings.account.verify_code
    uri = URI.parse("#{Settings.url.wallet_journal}?keyID=#{key_id}&vCode=#{verify_code}&accountKey=#{account_key}")
    http = Net::HTTP.new(uri.host,uri.port)
    http.use_ssl = (uri.scheme == 'https')
    request = Net::HTTP::Get.new(uri.path + "?" + uri.query)
    response = http.start { |h| h.request(request).body }
    puts "response :"
    puts response
    XMLObject.new(response)
  end

  def bulk_persist(journals)
    journals.each do |tran|
      if not WalletJournal.all(transaction_id: tran.transaction_id).present?
        puts "insert journal #{tran.transaction_id}"
        tran.save
      end
    end
  end

end
