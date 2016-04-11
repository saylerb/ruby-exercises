class TrickOrTreater
  attr_reader :dressed_up_as, :bag
  def initialize(costume)
    @costume = costume
    @dressed_up_as = costume.style
    @bag = []
  end

  def has_candy?
    not @bag.empty?
  end

  def candy_count
    @bag.length
  end

  def eat
    @bag.pop
  end


end
