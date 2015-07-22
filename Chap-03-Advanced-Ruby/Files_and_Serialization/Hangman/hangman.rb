@all_lines = File.readlines "wordlist.txt"
@guess_count = 8

def sel_code(code="")
while code.length < 5 || code.length > 12
code = @all_lines.sample.downcase.chomp
end
code
end

def get_code()
   puts "You have #{@guess_count} guesses left. Enter your guess "
   
   gets.chomp
end

def check_code
  matched_pos = []
  @my_code.split('').each_with_index {|letter,ind| matched_pos << ind if letter == @guess} 
  
  @guess_count -= 1 if matched_pos.empty?
  matched_pos
end

def disp_change(match)
  match.each do |match_val|
    @disp_arr[match_val] = @guess
  end
end

def game_over?(disp)
  disp.join('') == @my_code ? true : false
end

# def show_format(code)
#   l = code.length
#
  
@my_code = sel_code


# run starts

p "Crack the word"
p @my_code

@disp_arr = []
@my_code.length.times{|t| @disp_arr << "_"}

puts "Word set. Time to play the game!!"
while @guess_count > 0
  puts @disp_arr.join(" ")
  @guess = get_code
  # p @guess
  match_arr = check_code
  p match_arr
  disp_change(match_arr)
  break if game_over?(@disp_arr)
end

