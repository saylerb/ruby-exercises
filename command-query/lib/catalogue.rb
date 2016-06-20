require 'pry'
require_relative "product"

class Catalogue
  def initialize
    @index = []
  end

  def << (product)
    @index << product
  end

  def cheapest
    if @index.empty?
      nil
    else
      @index.min_by { |product| product.price }.name
    end
  end
end
