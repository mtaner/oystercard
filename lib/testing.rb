require './Oyster_card.rb'

p card = Oyster_card.new
card.top_up(4)
p "New card balance:#{card.balance}"
card.deduct(3)
p "New card balance:#{card.balance}"
