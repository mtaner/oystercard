require 'Oyster_card.rb'

describe Oyster_card do

	subject(:card) {described_class.new}

	it "new card balance should be 0" do
		expect(card.balance).to eq 0
	end

	it "can top up" do
		card.top_up(1)
		expect(card.balance).to eq 1
	end

	it "Can't top up more than 90" do
		expect{ card.top_up(1+Oyster_card::MAXIMUM) }.to raise_error "Cannot top up more than £90."

	end

	it "Can deduct" do
		card.deduct(1)
		expect(card.balance).to eq -1
	end
	# it {is_expected.to respond_to(:balance)}

end
