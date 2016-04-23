require "./lib/bag"

class TrickOrTreater

  attr_reader :bag, :sugar_level

  def initialize(costume)
    @costume = costume
    @bag = []
    @sugar_level = 0
  end

  def dressed_up_as
    @costume.style
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.count
  end

  def eat
    @sugar_level += @bag.pop.sugar
  end 

end
