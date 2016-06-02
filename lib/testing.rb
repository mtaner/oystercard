require './Oyster_card.rb'
require './Station.rb'

p card = Oyster_card.new
card.top_up(4)
p "New card balance:#{card.balance}"

p waterloo = Station.new(1, "waterloo")
p bank = Station.new(1, "bank")


card.touch_in(waterloo)
p card.in_journey?
p "Entry station: #{card.entry_station}"
card.touch_out(bank)
p card.in_journey?
p "Card balance:#{card.balance}"
# p card.journey_history
