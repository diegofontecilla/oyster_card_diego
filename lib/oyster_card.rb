class OysterCard
  attr_reader :balance

  DEFAULT_MAX_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    message = "Failed: exceeded max balance #{DEFAULT_MAX_LIMIT}"
    fail message if (@balance + amount) > DEFAULT_MAX_LIMIT
    @balance += amount
  end

  def touch_in
    message = "Cannot touch in, less than #{MINIMUM_AMOUNT} pound on card"
    fail message if @balance < MINIMUM_AMOUNT
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def touch_out
      deduct(MINIMUM_AMOUNT)
      @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
