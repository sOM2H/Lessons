def fib n 
  return n if ( 0..1 ).include? n
  (fib(n - 1) + fib(n - 2))
end

arr = []
i = 1
while fib(i) < 100 do
  arr << fib(i)
  i += 1
end

puts arr