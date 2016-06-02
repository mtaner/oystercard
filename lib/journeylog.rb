require_relative 'Journey'
class JourneyLog

	attr_reader :journey_history, :journey

	def initialize
		@journey_history = Array.new
	end

	def start entry
			#journey exists - this is the second touch in -
			# there was no touch out.
			# Make them pay for it - start a new journey with the new station.
			write_journey if !!journey
			@journey = Journey.new
			@entry = entry
			journey.journey_start(entry)
	end

	def finish exit
		@exit = exit
		write_journey
		journey.journey_finish(exit)
	end

	def log
		journey_history
	end

	private

	attr_reader :entry, :exit

	def kill_journey
		@journey = nil
	end

	def write_journey
		journey_history << Hash[entry, exit]
	end

end

jlog = JourneyLog.new
jlog.start("Bank")
p jlog.start("Angel")
p jlog.finish("Euston")
p jlog.log
