# coding: utf-8

class ManufacturingCosts
  include Virtus

  attribute :item_id, Integer
  attribute :item_name, String
  attribute :item_name_ja, String
  attribute :price, Float
  attribute :price_of_top_n, Float
  attribute :create_count, String
  attribute :sum_price, Float

  # FIXME: sql直書をやめる
  # FIXME: twowaysql + sql_finder のようなsmartな書き方を作る
  def self.costs
    sql = <<-EOF
      select
        pr.typeID as item_id,
        inv.typeName as item_name,
        trn.text as item_name_ja,
        (sum(pr.sumPrice) / sum(pr.createCount)) as price,
        sum(pr.createCount) as create_count,
        sum(pr.sumPrice) as sum_price
      from
        ProductResult as pr
      inner join
        invTypes as inv
      on
        pr.typeID = inv.typeID
      inner join
        trnTranslations as trn
      on
        trn.keyID = pr.typeID
      where
        trn.languageID = 'JA' and
        trn.tcID = 8
      group by
        pr.typeID
    EOF
    select_by_raw_sql(sql)
  end

  # FIXME: 性能が問題になる場合はクエリを改善する
  # 過去n個分の原価を計算する
  def self.costs_of_top(n)
    return ManufacturingCosts.none unless n.to_s =~ /\d+/
    sql = <<-EOF
      select
        pr.typeID as item_id,
        inv.typeName as item_name,
        trn.text as item_name_ja,
        (sum(pr.sumPrice) / sum(pr.createCount)) as price,
        top_n.price as price_of_top_n,
        sum(pr.createCount) as create_count,
        sum(pr.sumPrice) as sum_price
      from
        ProductResult as pr
      inner join
        invTypes as inv
      on
        pr.typeID = inv.typeID
      inner join
        trnTranslations as trn
      on
        trn.keyID = pr.typeID
      inner join
        (
          select
            top_n.typeID as type_id,
            (sum(top_n.sumPrice) / sum(top_n.createCount)) as price
          from
            ProductResult as top_n
          where
            (
              select
                count(*)
              from
                ProductResult as pr2
              where
                top_n.typeID = pr2.typeID
                and top_n.sumPrice <= pr2.sumPrice
            ) <= #{n}
          group by
            top_n.typeID
        ) as top_n
      on
        top_n.type_id = pr.typeID
      where
        trn.languageID = 'JA'
        and trn.tcID = 8
      group by
        pr.typeID
    EOF
    select_by_raw_sql(sql)

  end

  def self.select_by_raw_sql(sql, params = [])
    result = repository(:default)
      .adapter
      .select(sql, *params)
    result.each do |r|
      c = ManufacturingCosts.new
      r.each_pair { |k,v| c.__send__("#{k}=", v) }
      c
    end
  end

end
