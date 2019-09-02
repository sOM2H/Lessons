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
    self.occupied_volume += volume unless crowded?(volume)
  end

  def free_volume
    @volume - self.occupied_volume
  end

  private

  attr_writer :occupied_volume

  def crowded?(volume)
    (self.occupied_volume + volume) > @volume
  end
end
