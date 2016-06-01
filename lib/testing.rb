require './Oyster_card.rb'

p card = Oyster_card.new
card.top_up(4)
p "New card balance:#{card.balance}"




card.touch_in(:Waterloo)
p card.in_journey?
p "Entry station: #{card.entry_station}"
card.touch_out(:Bank)
p card.in_journey?
p "Card balance:#{card.balance}"
p card.journey_history
