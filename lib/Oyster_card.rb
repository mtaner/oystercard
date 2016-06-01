class Oyster_card

	attr_reader :balance
	MAXIMUM = 90

	def initialize balance = 0
		@balance = balance
	end

	def top_up value
		fail "Cannot top up more than £90." if value > MAXIMUM
		@balance += value
	end

	def deduct value
		@balance -= value

	end

end
