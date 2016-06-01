require 'Journey.rb'


describe Journey do
	# dummy station 1
	let(:station) { double :station}
	# dummy station 2
	let(:other_station) { double :station}

	subject(:journey) {described_class.new}

	it 'has a penalty fare by default' do
		# check if fare is penalty charge by default
		expect(journey.fare).to eq Journey::PENALTY
	end

	it "returns itself when exiting a journey" do
		# check output
		expect(journey.finish(station)).to eq(journey)
	end

	it 'has an entry station' do
		# start journey first
		journey.start(station)
		# check if entry station is stored 
		expect(journey.entry_station).to eq station
	end

	it "returns a penalty fare if no exit station given" do
		# start journey first
		journey.start(station)
		# check the fare for unfinished journey
		expect(journey.fare).to eq Journey::PENALTY
	end

	it 'calculates a fare when journey is finished' do
		# start journey 
		journey.start(station)
		# end journey 
		journey.finish(other_station)
		# check the fare 
		expect(journey.fare).to eq 1
	end

end
