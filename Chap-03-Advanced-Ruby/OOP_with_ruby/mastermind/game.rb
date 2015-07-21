require_relative 'code.rb'

  class Game
    
    attr_accessor :guess_count,:guess,:guess_history
  
    def initialize 
      @guess_count = 1
      @thecode = Code.new
      @guess_history = []
    end
  
  
    def conv_code string #gets string and converts to an array of fixnums
      
        str_arr = string.split('')
        str_arr.collect! {|ele| ele.to_i}

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
      
  
    def game_over guess
      while guess_count != 13
      end
        
    
    end
    
    def get_guess
      p "Enter your guess no. #{@guess_count}"
      @guess = gets.chomp
      @guess_count += 1
    end

    def convert_guess 
    end
    
    def play
      p "Enter the code you like to set"
      thecode = Code.new
      code_array = conv_code(val_code)
      # p "code_array #{code_array}"
      thecode.set_code code_array
      p "The code #{thecode.value} has been set successfully"
    end
    
  end

if __FILE__ == $0
  mygame = Game.new
  mygame.play
end 