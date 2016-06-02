class Journey

	attr_reader :fare, :entry_station

	MINIMUM = 1
	PENALTY = 6

	def initialize
		# start with nil values 
		@entry_station = nil
		@exit_station = nil

		# default fare is penalty until changed
		@fare = PENALTY
	end

	def start station
		# set entry station
		@entry_station = station
		# calculate fare
		get_fare
	end

	def finish station
		# set exit station
		@exit_station = station
		# calculate fare
		get_fare
		# return itself on finish
		self
	end

	def get_fare
		# a journey is only complete if start and end stations are present 
		if @entry_station && @exit_station
			# if both are there, the fare is £1
			@fare = MINIMUM
		else
			# if not, penalty 
			@fare = PENALTY
		end
	end

end