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

	it {is_expected.to respond_to(:top_up).with(1).argument}
	# it {is_expected.to respond_to(:balance)}

end
