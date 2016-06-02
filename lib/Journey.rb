require_relative 'station'

class Journey

	attr_reader :fare

	MINIMUM = 1
	PENALTY = 6

	def initialize
		# start with nil values
		@entry_station = nil
		@exit_station = nil

		# default fare is penalty until changed
		@fare = PENALTY
	end

	def journey_start station
		# set entry station
		@entry_station = station
		# calculate fare
		get_fare
	end

	def journey_finish station
		# set exit station
		@exit_station = station
		# calculate fare
		get_fare
		# return itself on finish
	end

	def get_fare
		# a journey is only complete if start and end stations are present
		if @entry_station && @exit_station
			# if both are there, the fare is £1
			# @fare = MINIMUM
			@fare = (@entry_station.zone - @exit_station.zone).abs + MINIMUM
		else
			# if not, penalty
			@fare = PENALTY
		end
	end

end
