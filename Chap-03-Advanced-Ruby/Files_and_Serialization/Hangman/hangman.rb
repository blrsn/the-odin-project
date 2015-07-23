require 'rubygems'
require 'nokogiri'
require 'open-uri'


class Hangman
  
  
  
  def clue
    @path = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{@my_code}?key=4adb8fce-4f98-49c1-8f57-95ba72ceb9b1"
    puts "Retrieving clue...Please wait"
    # puts @path
    doc = Nokogiri::HTML(open(@path))
    arr =  doc.css('dt')
    # puts arr
    puts "*"*30
    arr.each_with_index do |desc,ind| 
      puts "#{ind+1}. #{desc.text[1..-1]}\n\n"
      break if ind > 8
    end
    puts "*"*30
  end
  
  def reinitialize
    @all_lines = File.readlines "wordlist.txt"
    @guess_count = 8
    @wrong_guess = []

  end

  def sel_code(code="")
    
    while code.length < 5 || code.length > 12
    code = @all_lines.sample.downcase.chomp
    end
    code
    
  end

  def get_code
    inp = ""
    
    loop do
     puts "You have #{@guess_count} guesses left. Enter 'save' to save game,'clue' for clue "
     loop do
       inp = gets.chomp.downcase
       break if inp.match /clue/
       break if inp.match /save/
       break if inp.match /^[a-z]{1}$/
       puts "invalid entry. Regex potrukom"
     end
     
     break if @wrong_guess.empty?
     break if @wrong_guess.none? {|hist| hist== inp}
     puts "Oops. You have already entered '#{inp}'"
    end
    inp
  end

  def check_code
    matched_pos = []
    @my_code.split('').each_with_index {|letter,ind| matched_pos << ind if letter == @guess} 
  
    if matched_pos.empty?
       @guess_count -= 1 
       @wrong_guess << @guess
     end
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
  
  def save_game
    
    File.open("saved.csv","a") do |f|
    writer = [@my_code,@disp_arr.join,@guess_count,@wrong_guess.join]
    f << writer.join(',')
    end
  
  end
  
  def load_game
    
      f =File.open("saved.csv")
      saved_lines = f.readlines
      f.close
      saved_lines.each_with_index do |line,index|
        puts "#{index+1}. #{line.split(',')[1].split('').join(' ')}"
      end
      
      p "Enter the you would like to load"
      load_val = gets.chomp.to_i 
      load = saved_lines[load_val - 1].chomp
      load = load.split(',')
       @my_code = load[0]
       @disp_arr = load[1].split('')
       @guess_count = load[2].to_i
       @wrong_guess = load[3].split('')
       
       saved_lines.delete_at(load_val-1)
       File.open("saved.csv","w") do |file|
         file.puts saved_lines
       end
       
    end
     

  def game_play
    while @guess_count > 0
      puts @disp_arr.join(" ")
      @guess = get_code
      if @guess == "save"
        save_game
        break
      end
      if @guess == "clue"
        clue
        next
      end
      match_arr = check_code
      # p match_arr
      disp_change(match_arr)
      
      break if game_over?(@disp_arr)
      
      puts "misses: #{@wrong_guess.join(" ")}" if !(@wrong_guess.empty?)
       
    end
  end



  def play
    # run starts
    puts "Welcome to Hangman"
    
    loop do
      reinitialize
      
      puts "1.Start a new game"
      puts "2.Load a saved game"
      puts "3.Exit"
      
      input = gets.chomp
      case input
      when "1"
      
        @my_code = sel_code
        p "Crack the word"

        @disp_arr = []
        @my_code.length.times{|t| @disp_arr << "_"}

        puts "Word set. Find the word using the description"
        
      
        game_play
      
         puts "You won!! You found '#{@my_code}' with #{@guess_count} guesses remaining " if game_over?(@disp_arr)
      
        puts "The word is #{@my_code}. Keep tryin!!" if @guess_count == 0
      
      when "2"
        
        reinitialize
      
        load_game
      
        game_play
      
         puts "You won!! You found '#{@my_code}' with #{@guess_count} guesses remaining " if game_over?(@disp_arr)
      
        puts "The word is #{@my_code}. Keep tryin!!" if @guess_count == 0
        
      when "3"
        
        break
        
      else 
        puts "Please enter a valid choice"
      
      end 
    
    end
    
  end

end

game = Hangman.new
game.play

