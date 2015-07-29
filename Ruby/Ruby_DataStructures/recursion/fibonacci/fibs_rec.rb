
def fibs num
  return num if num < 2
  return fibs(num -1) + fibs(num -2)
end

p fibs(6)