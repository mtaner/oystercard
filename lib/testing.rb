require './Oyster_card.rb'
require './Station.rb'

p card = Oyster_card.new(10)

waterloo = Station.new(1, "waterloo")
bank = Station.new(1, "bank")

p "Card balance before :#{card.balance}"

card.touch_in(waterloo)
p "Card balance after first touch in: #{card.balance}"
card.touch_in(waterloo)
p "Card balance after second touch in (no change): #{card.balance}"

card.touch_out(bank)

p "Card balance after touch out (-1): #{card.balance}"
