class Santa
  def initialize
    @cookies_in_belly = 0
  end

  def fits?
    @cookies_in_belly < 3
  end
  
  def eats_cookies
    @cookies_in_belly += 1

  end
end
