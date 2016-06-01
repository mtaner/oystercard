require './Oyster_card.rb'

p card = Oyster_card.new
card.top_up(4)
p "New card balance:#{card.balance}"
card.deduct(3)
p "New card balance:#{card.balance}"

p "Card balance:#{card.balance}"

card.touch_in
p card.in_journey?
p "Entry station: #{card.entry_station}"
card.touch_out
p card.in_journey?
p "Card balance:#{card.balance}"
