class PassengerCarriage < Carriage
  attr_reader :occupied_places, :places

  def initialize(places = 50)
    @places = places
    @occupied_places = 0
  end

  def type
    :passenger
  end

  def occupy_place
    self.occupied_places += 1 unless full?
  end

  def free_places
    @places - self.occupied_places
  end

  private

  attr_writer :occupied_places

  def full?
    self.occupied_places == @places
  end
end
