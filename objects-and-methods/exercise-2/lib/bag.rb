class Bag
  attr_reader :count, :candies
  def initialize
   @count = 0 
   @candies = []
  end
  
  def empty?
    @candies.empty?
  end

  def <<(item)
    @candies << item
  end

  def count
    @candies.count
  end

  def contains?(name)
    @candies.any? do |candy|
      candy.type == name
    end
  end
  
  def grab(name)
    to_grab = @candies.find { |candy| candy.type == name }
    @candies.delete(to_grab)
    #to_grab
    
    # @candies.delete_at(@candies.index(item_to_remove))
  end

  def take(amount)
    @candies.pop(amount)
  end


end

