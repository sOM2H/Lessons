require 'colorize'
require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/carriage'
require_relative 'models/passenger_carriage'
require_relative 'models/cargo_carriage'
require_relative 'models/train'
require_relative 'models/passenger_train'
require_relative 'models/cargo_train'


@trains    = []
@stations  = []
@carriages = []

def load_seeds
  cargo_train = CargoTrain.new("000-00")
  passenger_train = PassengerTrain.new("000-01")
  3.times do |i|
    @stations << Station.new("Station #{i}")
  end
  10.times do |i|
    cargo_carriage = CargoCarriage.new(200)
    passenger_carriage =  PassengerCarriage.new(200)
    cargo_train.add_carriage cargo_carriage
    passenger_train.add_carriage passenger_carriage
    @carriages << cargo_carriage
    @carriages << passenger_carriage
  end
  @trains << cargo_train
  @trains << passenger_train
end

def create_cargo_train name
  begin
    train = CargoTrain.new(name)
    @trains << train 
    puts "Train #{train.object_id} created!".blue
  rescue ArgumentError => e
    puts e.inspect
  end
end

def create_passenger_train name
  begin
    train = PassengerTrain.new(name)
    @trains << train 
    puts "Train #{train.object_id} created!".blue
  rescue ArgumentError => e
    puts e.inspect
  end
end

def create_cargo_carriage
  begin
    carriage = CargoCarriage.new(count)
    @carriages << carriage
    puts "Carriage #{carriage.object_id} created!".blue
  rescue ArgumentError => e
    puts e.inspect
  end
end

def create_passenger_carriage
  begin
    carriage = PassengerCarriage.new(count)
    @carriages << carriage
    puts "Carriage #{carriage.object_id} created!".blue
  rescue ArgumentError => e
    puts e.inspect
  end
end

def create_station name
  begin
    station = Station.new(name)
    @stations << station
    puts "Station #{station.object_id} created!".blue
  rescue ArgumentError => e
    puts e.inspect
  end
end

def print_trains
  @trains.each_with_index do |t, i| 
    puts "Train: #{i}"
    puts "Number - #{t.number}"
    puts "Type - #{t.type}"
    puts "Carriages: "
    t.carriages.each_with_index do |c, i|
      puts "  Carriage: #{i}"
      puts "  Type: #{c.type}"
      puts "  Object id: #{c.object_id}"
      puts " "
    end
    puts "Object id - #{t.object_id}"
    puts ""
  end
end

def print_stations
  @stations.each_with_index do |s, i|
    puts "Station: #{i}"
    puts "Name - #{s.name}"
    puts "Trains: "
    s.trains.each_with_index do |t, i|
      puts "  Train: #{i}"
      puts "  Type: #{t.type}"
      puts "  Carriages count: #{t.carriages.count}"
      puts "  Object id: #{t.object_id}"
      puts ""
    end
    puts "Object id - #{s.object_id}"
    puts ""
  end
end

def print_carriages
  @carriages.each_with_index do |c, i|
    puts "Carriage: #{i}"
    puts "Type - #{c.type}"
    puts "Object id - #{c.object_id}"
    puts ""
  end
end

def print_help
  puts "Create [class] [arg0] .. [argn] - create class object.\nList [class] - list of object class\nAdd Train to Station [train object id] [ station object id]\nAdd Carriage to Train [carriage object id] [train object id]"
end

def add_train_to_station(train, station)
  t = @trains.find{|t| t.object_id == train}
  s = @stations.find{|s| s.object_id == station}
  if s != nil && t != nil
    s.add_train t
    puts "Train #{t} added to station #{s}!".yellow
  else
    puts "Shit Happens!".red
  end
end

def add_carriage_to_train(carriage, train)
  c = @carriages.find{|c| c.object_id == carriage}
  t = @trains.find{|t| t.object_id == train}
  if c != nil && t != nil
    t.add_carriage c
    puts "Carriage #{c} added to train #{t}!".yellow
  else
    puts "Shit Happens!".red
  end
end

def unhook_carriage_from_train(carriage, train)
  t = @trains.find{|t| t.object_id == train}
  if t != nil
    t.carriages.delete_if{|c| c.object_id == carriage}
    puts "Carriage unhooked from train #{t}!".yellow
  else
    puts "Shit Happens!".red
  end
end

print "user@user~$ ".green
while input = gets.chomp
  break if input == "exit"

  split_input = input.split
  if input == "Help"
    print_help
  elsif split_input[0] == "Create"
    if split_input[1] == "PassangerTrain"
      create_passenger_train(split_input[2])
    elsif split_input[1] == "CargoTrain"
      create_cargo_train(split_input[2])
    elsif split_input[1] == "Station"
      create_station(split_input[2])
    elsif split_input[1] == "CargoCarriage"
      create_cargo_carriage(split_input[2])
    elsif split_input[1] == "PassengerCarriage"
      create_passenger_carriage(split_input[2])
    else
      puts "#{split_input[1] || "Class"} not found"
    end
  elsif split_input[0] == "List"
    if split_input[1] == "Train"
      print_trains
    elsif split_input[1] == "Station"
      print_stations 
    elsif split_input[1] == "Carriage"
      print_carriages
    end
  elsif input.include? "Add Train to Station"
    add_train_to_station(split_input[4].to_i, split_input[5].to_i)
  elsif input.include? "Add Carriage to Train"
    add_carriage_to_train(split_input[4].to_i, split_input[5].to_i)
  elsif input.include? "Unhook Carriage from Train"
    unhook_carriage_from_train(split_input[4].to_i, split_input[5].to_i)
  elsif input.include? "Load seeds"
    load_seeds 
  else
    puts "Not valid command".red
  end
  print "user@user~$ ".green
end
