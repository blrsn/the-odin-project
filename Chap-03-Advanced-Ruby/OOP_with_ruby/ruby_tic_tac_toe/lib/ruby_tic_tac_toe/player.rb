module RubyTicTacToe
  
  # class Player has 2 states  - (name and mark)
  # initialized by hash having keys :name and :mark
  
  class Player
    attr_accessor :name,:mark
    def initialize(input)
      @name = input.fetch(:name)
      @mark = input.fetch(:mark)
    end
  
  end
  
end
