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
    @occupied_places += 1 unless full?
  end

  def free_places
    @places - @occupied_places
  end

  def occupied_places
    @occupied_places
  end

  private

  def full?
    @occupied_places == @places
  end
end
