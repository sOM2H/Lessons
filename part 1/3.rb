arr = Array.new
3.times { arr << gets.to_i }
arr.sort! { |a, b| b <=> a }
puts (arr[0]**2 == (arr[1]**2 + arr[2]**2)) ? "True" : "False"
