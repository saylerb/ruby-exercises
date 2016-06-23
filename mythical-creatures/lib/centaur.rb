class Centaur
  attr_reader :name, :breed, :energy
  def initialize(name, breed)
    @name = name
    @breed = breed
    @energy = 3
    @standing = true
    @sick = false
  end

  def shoot
    if cranky? || laying?
      "NO!"
    else
      @energy -= 1
      "Twang!!!"
    end
  end

  def run
    if cranky? || laying?
      "NO!"
    else
      @energy -= 1
      "Clop clop clop clop!!!"
    end
  end

  def cranky?
    @energy <= 0
  end

  def standing?
    @standing
  end

  def sleep
    if !cranky? && standing?
      "NO!"
    else
      @energy = 3
    end
  end

  def lay_down
    @standing = false
  end

  def laying?
    @standing == false
  end

  def stand_up
    @standing = true
  end

  def drink_potion
    if !cranky?
      @sick = true
    elsif cranky? && standing?
      @energy = 3
    else
      "NO!"
    end
  end

  def sick?
    @sick
  end
     
end
