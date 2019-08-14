hash = Hash.new
while true do
    name = gets.chomp
    break if name.downcase == "stop"
    cost = gets.to_f
    count = gets.to_f
    hash[name] = {cost: cost, count: count}
end
puts hash
hash.each{|t, h| puts t + ": " + (h[:count]*h[:cost]).to_s}
sum = 0
hash.each{|t, h| sum+= (h[:count]*h[:cost])}
puts sum