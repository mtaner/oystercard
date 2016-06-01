class Oyster_card

	attr_reader :balance
	MAXIMUM = 90
	MINIMUM = 1

	def initialize balance = 0
		@balance = balance
		@in_journey = false
	end

	def top_up value
		fail "Cannot top up more than £90." if value > MAXIMUM
		@balance += value
	end

	def in_journey?
		@in_journey
	end 

	def touch_in
		fail "Insufficient funds" if @balance < MINIMUM
		@in_journey = true
	end

	def touch_out
		deduct(MINIMUM)
		@in_journey = false
	end 

	private
	def deduct value
		@balance -= value
	end

end
