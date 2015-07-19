module RubyTicTacToe
  
  class Player
    attr_accessor :name,:mark
    def initialize(input)
      @name = input.fetch(:name)
      @mark = input.fetch(:mark)
    end
    
    
    
  end
  
end
