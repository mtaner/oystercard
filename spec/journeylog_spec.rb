require 'journeylog'
describe JourneyLog do
	subject(:journeylog) {described_class.new}

	let(:paddington) {double(:station)}

	let(:liverpool_st) {double(:station)}

	describe "#start" do
		it {is_expected.to respond_to(:start)}
	end
	describe "#finish" do
		it {is_expected.to respond_to(:finish)}
	end

	describe '#log' do
		it {is_expected.to respond_to(:log)}
		it 'does stuff ' do
			p '-----------'
			p journeylog.start(paddington)
			p journeylog.finish(liverpool_st)
			p journeylog.log
			expect(journeylog.log).to include(paddington => liverpool_st)
		end
	end
end