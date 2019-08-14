require 'active_support/all'

d = gets.to_i
m = gets.to_i
y = gets.to_i

count = 0
i = 1

while i < m do
    count += Time.days_in_month(i, y)
    i += 1
end

puts count + d

    