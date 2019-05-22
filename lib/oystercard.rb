class Oystercard
  LIMIT = 90
  MINIMUM = 1
  MINIMUM_FARE = 1.5
  attr_reader :balance, :journey

  def initialize(balance=0 , journey = Journey.new)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    raise "limit is £#{LIMIT}" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise "not enough funds" if @balance < MINIMUM
    @journey.set_entry(station)
  end

  def touch_out(fare=MINIMUM_FARE, station)
    deduct(fare)
    @journey.set_exit(station)
    @journey.save_journey
    @journey.reset
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
