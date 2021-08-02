class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    if @inventory.empty?
      return 0
    end

    @inventory.each do |single_item, count|
      if single_item == item
        return count
      end
    end
    0
  end

  def stock(item, count)
    if !@inventory.key?(item)
      @inventory[item] = count
    else
      prev_count = @inventory[item]
      @inventory[item] = prev_count + count
    end
  end

  def potential_revenue
    array = []

    @inventory.each do |item, count|
      (item.price * count)
      require 'pry'; binding.pry
    end
  end
end
