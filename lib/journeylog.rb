require_relative 'Journey'
class JourneyLog

	attr_reader :journey_history, :journey

	def initialize
		@journey_history = Array.new
		@journey = Journey.new
		@entry = nil
		@exit = nil
	end

	def start entry
		journey.journey_start(entry)
		@entry = entry
		current_journey
	end

	def finish exit
		journey.journey_finish(exit)
		@exit = exit
		current_journey
	end

	def log
		journey_history
	end

	private
	attr_reader :entry, :exit
	def current_journey
		journey_history << Hash[entry, exit]
	end

end


p jl = JourneyLog.new
p jl.start(:one)
p jl.finish(:two)
p jl.log