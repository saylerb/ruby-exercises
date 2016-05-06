class Dog
  def initialize
    @stomach_full = false
  end

  def hungry?
    !@stomach_full
  end

  def eat
    @stomach_full = true
  end

end
