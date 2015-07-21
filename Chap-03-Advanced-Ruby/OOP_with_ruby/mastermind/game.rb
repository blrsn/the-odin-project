require_relative 'code.rb'

  class Game
    
    attr_accessor :guess_count,:guess,:guess_history,:match_history
  
    def initialize 
      @guess_count = 1
      @thecode = Code.new
      @guess_history = []
      @match_history = []
    end
  
  
    def conv_code string #gets string and converts to an array of fixnums
      
        str_arr = string.split('')
        str_arr.collect! {|ele| ele.to_i}

    end
    
    def to_str array
      array.reduce("") {|sum,ele| sum = sum + ele.to_s}
    end
    
    def val_code  #gets input and checks for valid length
      check = true
      while check
        input = gets.chomp
        if input.length == 4
          check = false
        else
          p "Invalid Code length"
        end
      end
      input
    end
      
  
    def game_over
      match_history.any? {|ele| ele=="#{'* ' * 4 }" }
    end
    
    def get_guess
      p "Enter your guess no. #{@guess_count}"
      @guess = conv_code(gets.chomp)
      @guess_count += 1
    end

    def history_maker
      guess_history << guess
      match_history << "#{'* ' * @thecode.hits(guess)}#{'|' * @thecode.close(guess)}" 
    end
    
    def formatted_history
      p "Guesses so far"
      guess_history.each_with_index do |gue,i|
      puts "#{to_str(gue)} #{match_history[i]}"
      end
    end
    
    def play
      p "Enter the code you like to set"
      @thecode = Code.new
      code_array = conv_code(val_code)
      @thecode.set_code code_array
      p "Code set successfully"
      
      j=0
      while j != 12
      get_guess 
      history_maker
      formatted_history
      break if game_over
      j += 1
      end
      
    end
    
  end

if __FILE__ == $0
  mygame = Game.new
  mygame.play
end 