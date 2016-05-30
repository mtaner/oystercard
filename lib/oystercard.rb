class Oystercard

MAXIMUM_BALANCE = 90

attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
  	fail "Maximum card balance exceeded. Maximum balance is: #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

end
