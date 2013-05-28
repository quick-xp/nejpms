# coding: utf-8

# rails runner "Jobs::AssetListCompare.new.run"
class Jobs::AssetListCompare
  def run

    new_type_id_lists = AssetLists.aggregate(
      #grouping key
      :type_id,
      :location_id,

      # summary target
      :quantity.sum,

      :fields => [:type_id,:location_id],
      :unique => true,
      # order by
      :order => [:type_id.asc])

    old_type_id_lists = AssetListsComp.aggregate(
      #grouping key
      :type_id,
      :location_id,

      # summary target
      :quantity.sum,

      :fields => [:type_id,:location_id],
      :unique => true,
      # order by
      :order => [:type_id.asc])


    puts "在庫推移計算 開始"

    flg = false

    for new in new_type_id_lists.each do
      flg = false
      for old in old_type_id_lists.each do
        # type_id と location_id が一致した場合
        if new[0] == old[0] &&
          new[1] == old[1] then
          transition = new[2] - old[2]

          flg = true #一致した

          #在庫に変化があった場合
          if transition != 0 then
            puts "Item:" + new[0].to_s + " 推移:" + transition.to_s
            inv = InventoryTransitions.new
            inv.type_id = new[0]
            inv.location_id = new[1]
            inv.count = transition
            inv.add_date = Time.now
            inv.save
          end
        end
      end

      #new にしか存在しない場合
      if flg == false then
        puts "Item:" + new[0].to_s + " 新規推移:" + new[2].to_s
        inv = InventoryTransitions.new
        inv.type_id = new[0]
        inv.location_id = new[1]
        inv.count = new[2]
        inv.add_date = Time.now
        inv.save
      end
    end

    for old in old_type_id_lists.each do
      flg = false
      for new in new_type_id_lists.each do
        # type_id と location_id が一致した場合
        if new[0] == old[0] &&
          new[1] == old[1] then
          flg = true #一致した
        end
      end

      #old にしか存在しない場合
      if flg == false then
        puts "Item:" + old[0].to_s + "削除推移:" + (-(old[2])).to_s
        inv = InventoryTransitions.new
        inv.type_id = old[0]
        inv.location_id = old[1]
        inv.count = old[2]
        inv.add_date = Time.now
        inv.save
      end
    end

  end
end
