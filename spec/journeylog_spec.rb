require 'journeylog'
describe JourneyLog do
	subject(:journeylog) {described_class.new}

	let(:paddington) {double(:station)}

	let(:liverpool_st) {double(:station)}

	describe "#start" do
		it {is_expected.to respond_to(:start)}
		it "should return correct fare(panelty or normal charge)" do
			expect(subject.start(paddington)).to eq Journey::PENALTY
		end
	end
	describe "#finish" do
		it {is_expected.to respond_to(:finish)}
	end

	describe '#log' do
		it {is_expected.to respond_to(:log)}
		it 'shows a recorded journey' do
			journeylog.start(paddington)
			journeylog.finish(liverpool_st)
			expect(journeylog.log).to include(paddington => liverpool_st)
		end
	end



end
