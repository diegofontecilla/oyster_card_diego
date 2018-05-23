class OysterCard
  attr_reader :balance, :entry_station, :exit_station, :journeys

  DEFAULT_MAX_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    message = "Failed: exceeded max balance #{DEFAULT_MAX_LIMIT}"
    fail message if (@balance + amount) > DEFAULT_MAX_LIMIT
    @balance += amount
  end

  def touch_in(station)
    message = "Cannot touch in, less than #{MINIMUM_AMOUNT} pound on card"
    fail message if @balance < MINIMUM_AMOUNT
    @entry_station = station
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_out(station)
    deduct(MINIMUM_AMOUNT)
    @journeys << { entry: @entry_station, exit: station }
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
