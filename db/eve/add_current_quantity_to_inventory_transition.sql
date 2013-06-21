-- 現在の在庫数を保存できるようにする
alter table InventoryTransition add column currentQuantity integer not null after `count`;

-- 6/15 より前のデータは不正なもののため削除
delete from
  InventoryTransition
where
  addDate < '2013-06-15 00:00:00';

-- 移行用。在庫数の推移から、その時点の在庫数を計算する
update
  InventoryTransition as i3
inner join (
  select
    i1.id,
    sum(i2.count) as summary
  from
    InventoryTransition as i1
  inner join
    InventoryTransition as i2
  on
    i1.typeID = i2.typeID
  where
    i2.id <= i1.id
  group by
    i1.id
  ) as result
on
  i3.id = result.id
set
  i3.currentQuantity = result.summary;
