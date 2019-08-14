class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train train
    if train.class.name.eql? "Train"
      @trains.push(train)
    else
      raise "Train class mзфust equals 'Train'."
    end
  end

  def print_trains
    @trains.each{ |t| puts t.name}
  end

  def print_trains_by_type
    puts "Passengers:"
    @trains.each{|t| puts t.name if t.type = "passenger"}
    puts "Freight:"
    @trains.each{|t| puts t.name if t.type = "cargo"}
  end
  
  def departure_train train_name
    @trains.delete_if { |t| t.name.eql? train_name }
  end
end
