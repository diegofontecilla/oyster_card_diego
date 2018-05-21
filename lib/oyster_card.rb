class Oystercard
  attr_reader :balance

  DEFAULT_MAX_LIMIT = 90

  def initialize(max_amount = DEFAULT_MAX_LIMIT)
    @max_amount = max_amount
    @balance = 0
  end

  def top_up(amount)
    message = "Card top up failed: exceeded maximum balance"
    fail message if (@balance + amount) > @max_amount
    @balance += amount
  end
end
