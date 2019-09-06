require './models/train'
require './modules/accessor'

class Station
  include Validation
  include Acessors

  strong_attr_accessor :name, String
  attr_accessor_with_history :trains

  validate(:name, :format, '\A[A-Z]{1}\w{2,}\z')

  @@instanses = []

  def initialize(name)
    @name = name
    @trains = []
    validate!

    @@instanses << self 
  end

  class << self
    def all
      @@instanses
    end
  end

  def add_train(train)
    valid_train? train
    @trains.push(train)
  end

  def each_trains
    @trains.each { |t| yield t }
  end

  def print_trains
    @trains.each { |t| puts t.number }
  end

  def print_trains_by_type
    p @trains.each_with_object({}) { |t, hsh| hsh[t.type] = (hsh[t.type] || []) << t.number }
  end

  def departure_train(train_name)
    @trains.delete_if { |t| t.name == train_name }
  end
end
