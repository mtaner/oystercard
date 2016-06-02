require_relative 'Journey'
class JourneyLog

	attr_reader :journey_history, :journey

	def initialize
		@journey_history = Array.new
	end

	def start entry
		no_touch_out if !!journey
		@journey = Journey.new
		@entry = entry
		fare = journey.journey_start(entry)
		@penalty ? fare : 0
	end

	def finish exit
		no_touch_in unless !!journey
		@exit = exit
		fare = journey.journey_finish(exit)
		write_journey
		kill_journey
		fare
	end

	def log
		journey_history
	end

	private

	attr_reader :entry, :exit

	def no_touch_out
		@exit = nil
		@penalty = true
		write_journey
		kill_journey
	end

	def no_touch_in
		@journey = Journey.new
		@journey.journey_start(nil)
	end

	def kill_journey
		@journey = nil
	end

	def write_journey
		journey_history << Hash[entry, exit]
	end

end
