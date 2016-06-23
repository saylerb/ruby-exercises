class Pirate
  attr_reader :name, :job, :booty
  def initialize(name, job = "Scallywag")
    @name = name
    @job = job
    @chances = 3
    @booty = 0
  end
  
  def cursed?
    @chances <= 0
  end

  def commit_heinous_act
    @chances -= 1
  end

  def rob_ship
    @booty += 100
  end
end
