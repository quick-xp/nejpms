# coding: utf-8

# rails runner "Jobs::AssetListCompare.new.run"
# 同期待ちを同期済みにする
class Jobs::AssetListCompare
  def run
    puts "在庫同期待ち反映 開始"
    AssetListsComp.new.reflect_asset_waiting
    puts "在庫同期待ち反映 終了"
  end
end
