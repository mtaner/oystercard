require "journey"
describe Journey do

let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}

  describe "#in_journey?" do

    it "knows that it is in a journey" do
      subject.set_entry_station(entry_station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe '#set_entry_station' do
    it 'should receive the entry_station from another object' do
      expect(subject.set_entry_station(entry_station)).to eq entry_station
    end
  end

  describe '#set_exit_station' do
    it 'should receive the exit_station from another object' do
      expect(subject.set_exit_station(exit_station)).to eq exit_station
    end
  end




  # describe "#journey_history" do
  #   it "returns a journey's history" do
  #     subject.journey << {entry_station => exit_station}
  #     expect(subject.journey_history({entry_station => exit_station})).to include({entry_station => exit_station})
  #   end
  # end
end
