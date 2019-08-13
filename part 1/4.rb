a = gets.to_i
b = gets.to_i
c = gets.to_i
d = b**2 - 4*(a*c)
if d < 0
  puts "Корней нет"
elsif d == 0
  puts "x = " + ((-b + Math.sqrt(d))/2*a).to_s
else
  puts "x1 = " + ((-b + Math.sqrt(d))/2*a).to_s
  puts "x2 = " + ((-b - Math.sqrt(d))/2*a).to_s
end
