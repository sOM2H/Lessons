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
    return @trains.push(train) if valid_train? train
    raise_not_valid_object train
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
    raise ArgumentError.new("Name class must equals 'String'") unless @name.class.name == "String"
    true
  end

  def valid_train? object
    object.class.name.include? "Train"
  end

  def raise_not_valid_object object
    raise "#{object} class must equals '#{object}'."
  end
end
