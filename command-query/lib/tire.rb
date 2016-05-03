class Tire
  def initialize
    @tire_flat = false
  end

  def flat?
    @tire_flat
  end
  
  def blow_out
    @tire_flat = true
  end
end
