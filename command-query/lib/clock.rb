class Clock
  attr_reader :time
  def initialize
    @start = 6
  end

  def wait
    @start += 1
  end

  def time
    @start % 12
  end
end
