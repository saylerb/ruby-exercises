class Item
  attr_reader :name, :price, :discount
  def initialize(name, data)
    @name = name
    @price = data[:price]
    @discount = data[:discount]
  end

  def discounted_price
    price - discount
  end
end
