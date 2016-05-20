class Money
  attr_reader :amount

  def initialize
    @amount = 0
  end

  def earn(dollars)
    @amount += dollars
  end

  def spend(dollars)
    if @amount > 0
      @amount -= dollars
    else
      "You can't spend what you don't have"
    end
  end
  
end
