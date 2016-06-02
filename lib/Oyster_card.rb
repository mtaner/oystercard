require_relative 'journeylog'

class Oyster_card

	attr_reader :balance
	MAXIMUM = 90
	MINIMUM = 1

	def initialize balance = 0
		@balance = balance
		@journey_log = JourneyLog.new
	end

	def top_up value
		fail "Cannot top up more than £90." if value > MAXIMUM
		@balance += value
	end

	def touch_in entry_station
		fail "Insufficient funds" if @balance < MINIMUM
		deduct(@journey_log.start(entry_station))
	end

	def touch_out exit_station
		deduct(@journey_log.finish(exit_station))
	end

	private
	def deduct value
		@balance -= value
	end

end
