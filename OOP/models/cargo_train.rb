class CargoTrain < Train
  validate(:number, :format, NUMBER_FORMAT)
  def type
    :cargo
  end
end
