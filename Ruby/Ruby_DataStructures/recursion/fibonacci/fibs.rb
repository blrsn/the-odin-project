puts "Enter a number"
inp = gets.chomp
inp = inp.to_i

fib = []
current = 0
nextnum = 1


inp.times do |count|
  
  fib << current
  temp = current
  current = nextnum
  nextnum = temp + nextnum
  
end

p fib