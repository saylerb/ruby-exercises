class Wallet
  attr_reader :coins
  def initialize
    @values = { penny: 1, nickel: 5, dime: 10, quarter: 25, dollar: 100 }
    @coins = []
  end
  
  def cents
    unless coins.empty?
      @coins.reduce(0) { |sum, coin| sum += @values[coin] }
    else
      0
    end
  end

  def << (coin)
    coins << coin
  end

  def index_coin(coin)
    @coins.index(coin)
  end

  def take(*all_coins)
    all_coins.each do |coin| 
      @coins.delete_at(index_coin(coin)) unless index_coin(coin).nil?
    end
  end
end
