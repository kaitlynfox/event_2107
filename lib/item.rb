class Item

  attr_reader :name,
              :price 

  def initialize(attribues)
    @name = attribues[:name]
    @price = attribues[:price]
  end
end
