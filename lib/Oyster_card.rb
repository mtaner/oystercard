class Oyster_card

	attr_reader :balance, :entry_station, :journey_history
	MAXIMUM = 90
	MINIMUM = 1

	def initialize balance = 0
		@balance = balance
		@entry_station = nil
		@journey_history = Array.new
	end

	def top_up value
		fail "Cannot top up more than £90." if value > MAXIMUM
		@balance += value
	end

	def in_journey?
		@entry_station ? true : false
	end

	def touch_in entry_station
		fail "Insufficient funds" if @balance < MINIMUM
		@entry_station = entry_station
	end

	def touch_out exit_station
		deduct(MINIMUM)
		@journey_history << Hash[@entry_station, exit_station]
		@entry_station = nil
	end

	private
	def deduct value
		@balance -= value
	end

end
