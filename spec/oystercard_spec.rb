require 'Oyster_card.rb'

describe Oyster_card do

	subject(:card) {described_class.new}
	let(:paddington) {double(:station)}
	let(:liverpool_st) {double(:station)}
	it "new card balance should be 0" do
		expect(card.balance).to eq 0
	end

	it "can top up" do
		expect {card.top_up(1)}.to change{card.balance}.by(1)
	end

	it "Can't top up more than 90" do
		expect{ card.top_up(1+Oyster_card::MAXIMUM) }.to raise_error "Cannot top up more than £90."

	end

	it "Can charges on touch out" do
		expect {card.touch_out(paddington)}.to change{card.balance}.by(-Oyster_card::MINIMUM)
	end

	it "Can't touch in" do
		expect{ card.touch_in(paddington) }.to raise_error "Insufficient funds"
	end

end
