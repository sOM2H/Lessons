class Train
  attr_accessor :speed, :route
  attr_reader :number, :type, :carriages_count

  def initialize(number, type, carriages_count)
    @number = number
    @route = nil
    @type = type
    @speed = 0
    @carriages_count = carriages_count
    @current_number_station = 0
  end

  def print_carriages_count
    puts @carriages_count
  end


  def print_speed
    puts @speed
  end

  def current_station
    if @route.class.name.eql? "Route"
      puts @route.stations[@current_number_station].name
    else
      raise "Route not set."
    end
  end

  def previous_station
    if @route.class.name.eql? "Route"
      if @route.first_station?( @current_number_station )
        nil
      else
        puts @route.stations[@current_number_station - 1].name
      end
    else
      raise "Route not set."
    end

  end

  def next_station
    if @route.class.name.eql? "Route"
      if @route.last_station?(@current_number_station )
        nil 
      else
        puts @route.stations[@current_number_station + 1].name
      end
    else
      raise "Route not set."
    end
  end

  def add_carriage
    if @speed.eql? 0
      @carriages_count += 1
    else
      raise "Speed must equals 0."
    end
  end

  def delete_carriage
    if @speed.eql? 0
      @carriages_count -= 1
    else
      raise "Speed must equals 0."
    end
  end
end
