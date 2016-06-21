class Clearance
  attr_reader :items
  def initialize
    @items = []
  end

  def << (item)
    items << item
  end

  def best_deal
    unless items.empty?
      items.min_by { |item| item.discounted_price }.name
    end
  end
end
