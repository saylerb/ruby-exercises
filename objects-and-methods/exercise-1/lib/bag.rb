class Bag
  attr_reader :count, :candies

  def initialize
    @count = 0
    @candies = []
    
  end
    
  def empty?
   @candies.empty? 
  end

  def <<(candy)
   @candies << candy 
  end

  def count
    @candies.length
  end

  def contains?(name)
    @candies.any? do |candy|
      candy.type == name
    end
  end
  

end

