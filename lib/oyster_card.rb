class OysterCard
  attr_reader :balance

  DEFAULT_MAX_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    message = "Failed: exceeded max balance #{DEFAULT_MAX_LIMIT}"
    fail message if (@balance + amount) > DEFAULT_MAX_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
