class Event

  attr_reader :name,
              :food_trucks

  def initialize(name )
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_trucks_names
    names = []

    @food_trucks.each do |food_truck|
      names << food_truck.name
    end
    names
  end

  def food_trucks_that_sell(item)
    trucks = []

    @food_trucks.each do |truck|
      truck.inventory.each do |item_in_truck|
        if item_in_truck[0] == item
          trucks << truck
        end
      end
    end
    trucks
  end
end
