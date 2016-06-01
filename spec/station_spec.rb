require 'Station.rb'

describe Station do

	subject(:station) {described_class.new(1, "Bank")}

	it 'knows its name' do
		expect(station.name).to eq("Bank")
	end

	it 'knows its zone' do
		expect(station.zone).to eq(1)
	end
end