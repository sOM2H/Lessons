class PassengerTrain < Train
  validate(:number, :format, NUMBER_FORMAT)
  validate(:speed, :type, Integer)
  validate(:current_station, :type, Station, NilClass)
  def type
    :passenger
  end
end
