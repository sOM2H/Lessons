require "./models/train"

class Station
  attr_reader :name, :trains

  @@instanses = []

  def initialize(name)
    @name = name
    @trains = []
    @@instanses << self if valid?
  end

  class << self
    def all
      @@instanses
    end
  end

  def add_train train
    valid_train? train
    @trains.push(train)
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
  
  def valid?
    raise ArgumentError.new("Name class must equals 'String'") unless @name.class == String
    true
  end

  def valid_train? train
    raise_not_valid_train unless train.class.superclass == Train
  end

  def raise_not_valid_train
    raise "Train class must equals 'Train'."
  end
end
