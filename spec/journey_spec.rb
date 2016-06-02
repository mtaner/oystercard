require 'Journey.rb'


describe Journey do
	# dummy station 1
	let(:station) { double :station, zone: 1}
	# dummy station 2
	let(:other_station) { double :station, zone: 2}

	subject(:journey) {described_class.new}

	it 'has a penalty fare by default' do
		# check if fare is penalty charge by default
		expect(journey.fare).to eq Journey::PENALTY
	end

	it "returns itself when exiting a journey" do
		# check output
		expect(journey.journey_finish(station)).to eq(Journey::PENALTY)
	end

	it "returns a penalty fare if no exit station given" do
		# start journey first
		journey.journey_start(station)
		# check the fare for unfinished journey
		expect(journey.fare).to eq Journey::PENALTY
	end

	it 'calculates a fare when journey is finished' do
		# start journey
		journey.journey_start(station)
		# end journey
		journey.journey_finish(other_station)
		# check the fare
		expect(journey.fare).to eq 2
	end

end
