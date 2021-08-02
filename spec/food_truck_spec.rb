require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  it "exists" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck).to be_a(FoodTruck)
  end

  it "has a name" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.name).to eq("Rocky Mountain Pies")
  end

  it "has a storage for inventory" do
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    expect(food_truck.inventory).to eq({})
  end

  it "can check the store of a specific item" do
    # Need a food truck
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    # Need food items
    item1 = Item.new(
                      {
                        name: 'Peach Pie (Slice)',
                        price: "$3.75"
                      }
    )

    item2 = Item.new(
                      {
                        name: 'Apple Pie (Slice)',
                        price: '$2.50'
                      }
    )

    expect(food_truck.check_stock(item1)).to eq(0)
  end

  it "can stock an item into the inventory storage" do
    # Need a food truck
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    # Need food items
    item1 = Item.new(
                      {
                        name: 'Peach Pie (Slice)',
                        price: "$3.75"
                      }
    )

    item2 = Item.new(
                      {
                        name: 'Apple Pie (Slice)',
                        price: '$2.50'
                      }
    )

    # stock an item in the inventory
    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)
    food_truck.stock(item2, 12)

    expect(food_truck.check_stock(item1)).to eq(55)
    expect(food_truck.inventory).to eq({item1 => 55, item2 => 12})
  end

  it "can calculate the potential revenue for a truck" do
    # Need a food truck
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")

    # Need food items
    item1 = Item.new(
                      {
                        name: 'Peach Pie (Slice)',
                        price: "$3.75"
                      }
    )

    item2 = Item.new(
                      {
                        name: 'Apple Pie (Slice)',
                        price: '$2.50'
                      }
    )

    # stock an item in the inventory
    food_truck1.stock(item1, 30)
    food_truck1.stock(item1, 25)

    expect(food_truck1.potential_revenue).to eq(206.25)
  end
end
