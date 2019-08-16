class Station
  attr_reader :name, :trains

   @@all = []

  def initialize(name)
    @name = name
    @trains = []
    @@all << self
  end

  def self.all
    @all
  end

  def add_train train
    return @trains.push(train) if valid? train
    raise_not_valid_object
  end

  def print_trains
    @trains.each{ |t| puts t.number}
  end

  def print_trains_by_type
    p @trains.each_with_object({}) { |t, hsh| hsh[t.type] = (hsh[t.type] || []) << t.number }
  end
  
  def departure_train train_name
    @trains.delete_if { |t| t.name == train_name }
  end

  private

  def valid? object
    object.class.name == "Train"
  end

  def raise_not_valid_object object
    raise "#{object} class must equals '#{object}'."
  end
end
