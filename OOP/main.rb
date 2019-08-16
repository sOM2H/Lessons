require 'colorize'
require_relative 'models/station'
require_relative 'models/route'
require_relative 'models/carriage'
require_relative 'models/train'
require_relative 'models/passenger_train'
require_relative 'models/cargo_train'


trains    = []
stations  = []
routes    = []
carriages = []

print "user@user~$ ".green
while input = gets.chomp
  break if input == "exit"
  split_input = input.split

  if input == "Help"

    puts "Create [class] [arg0] .. [argn] - create class object.\nList [class] - list of object class\nAdd Train to Station [train object id] [ station object id]\nAdd Carriage to Train [carriage object id] [train object id]"

  elsif split_input[0] == "Create"
    if split_input[1] == "Train"
      train = Train.new(split_input[2], split_input[3])
      trains << train
      puts "Train #{train.object_id} created!".blue
    elsif split_input[1] == "Station"
      station = Station.new(split_input[2])
      stations << station
      puts "Station #{station.object_id} created!".blue
    elsif split_input[1] == "Carriage"
      carriage = Carriage.new(split_input[2])
      carriages << carriage
      puts "Carriage #{carriage.object_id} created!".blue
    else
      puts "#{split_input[1] || "Class"} not found"
    end
  elsif split_input[0] == "List"
    if split_input[1] == "Train"
      trains.each_with_index do |t, i| 
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
    elsif split_input[1] == "Station"
      stations.each_with_index do |s, i|
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
    elsif split_input[1] == "Carriage"
      carriages.each_with_index do |c, i|
        puts "Carriage: #{i}"
        puts "Type - #{c.type}"
        puts "Object id - #{c.object_id}"
        puts ""
      end
    end

  elsif input.include? "Add Train to Station"
    t = trains.find{|t| t.object_id == split_input[4].to_i}
    s = stations.find{|s| s.object_id == split_input[5].to_i}
    if s != nil && t != nil
      s.add_train t
      puts "Train #{t} added to station #{s}!".yellow
    else
      puts "Shit Happens!".red
    end
  elsif input.include? "Add Carriage to Train"
    c = carriages.find{|c| c.object_id == split_input[4].to_i}
    t = trains.find{|t| t.object_id == split_input[5].to_i}
    if c != nil && t != nil
      t.add_carriage c
      puts "Carriage #{c} added to train #{t}!".yellow
    else
      puts "Shit Happens!".red
    end
  elsif input.include? "Unhook Carriage from Train"
    t = trains.find{|t| t.object_id == split_input[5].to_i}
    if t != nil
      t.carriages.delete_if{|c| c.object_id == split_input[4].to_i}
      puts "Carriage unhooked from train #{t}!".yellow
    else
      puts "Shit Happens!".red
    end
  end
  print "user@user~$ ".green
end
