class CargoCarriage < Carriage
  attr_reader :occupied_volume, :volume

  def initialize(volume = 200)
    @volume = volume
    @occupied_volume = 0
  end

  def type
    :cargo
  end

  def occupy_volume(volume = 10)
    @occupied_volume += volume unless full?
  end

  def free_volume
    @volume - @occupied_volume
  end

  def occupied_volume
    @occupied_volume
  end

  private

  def full?
    @occupied_places_count == @places_count
  end
end
