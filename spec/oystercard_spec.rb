require 'Oyster_card.rb'

describe Oyster_card do

	subject(:card) {described_class.new}

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
		expect {card.touch_out}.to change{card.balance}.by(-Oyster_card::MINIMUM)
	end

	it {is_expected.to respond_to(:in_journey?)}

	it "Can't touch in" do
		expect{ card.touch_in }.to raise_error "Insufficient funds"
	end

	it "Can touch in" do
		card.top_up(Oyster_card::MINIMUM)
		card.touch_in 
		expect(card.in_journey?).to eq true
	end

	it "Can touch out" do
		card.touch_out
		expect(card.in_journey?).to eq false
	end

end
