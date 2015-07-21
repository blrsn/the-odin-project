
def val_code 
  check = true
  while check
    input = gets.chomp
    str_arr = input.split('')
    if str_arr.length == 4
      check = false
    else
      p "Invalid Code length"
    end
  end
  str_arr.map {|ele| ele.to_i}
end

p val_code