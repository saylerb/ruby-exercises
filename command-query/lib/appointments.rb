class Appointments
  attr_reader :earliest

  def initialize
    @all_apt = []
  end

  def at(time)
    @all_apt << time
  end

  def earliest
    @all_apt.min
  end

end
