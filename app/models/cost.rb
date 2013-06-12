# coding:utf-8
class Cost

  include DataMapper::Resource

  storage_names[:default] = 'Cost'

  property :type_id,Integer,field: 'typeID',key:true,required:true
  property :per_price, Float,field: 'perPrice'
  property :type, Integer,field: 'type'

  def calculate_material_cost(type_id)
    items = MaterialPurchase.all(:type_id => type_id)
    if items != nil then
      total_quantity = 0
      sum = 0
      items.map {|item|
        sum += item[:price] * item[:quantity]
        total_quantity += item[:quantity]
      }

      puts "item:"
      puts items[0][:type_id]
      puts "sum:"
      puts sum
      puts "quantity:"
      puts total_quantity

      return sum / total_quantity
    end

    return 0
  end

 def calculate_blueprint_cost(type_id)
    items = BluePrintPurchase.all(:type_id => type_id)
    if items != nil then
      total_quantity = 0
      sum = 0
      items.map {|item|
        sum += item[:price]
        total_quantity += item[:use_count]
      }

      puts "item:"
      puts items[0][:type_id]
      puts "sum:"
      puts sum
      puts "quantity:"
      puts total_quantity

      return sum / total_quantity
    end

    return 0
  end


end
