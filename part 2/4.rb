latters = Hash.new
('a'..'z').each_with_index{|var, i| latters[var] = i+1  if var =~ /[aeiou]/ }
puts latters