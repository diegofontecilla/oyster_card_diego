#require './spec/oyster_card_spec'
require './lib/oyster_card'

oyster = OysterCard.new
oyster.balance
oyster.top_up(2)
oyster.touch_in("Victoria")
p oyster.in_journey?
p oyster.balance
p oyster.touch_out('Kings Cross')
p oyster.in_journey?
