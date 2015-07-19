module RubyTicTacToe

  class Board
    attr_accessor :grid
    
    def initialize(input={})
      @grid = input.fetch(:grid,default_grid)
    end
    
    
    def default_grid
      Array.new(3) {Array.new(3){Cell.new}}
    end
    
    def get_cell(x,y)
      grid[x][y]
    end
    
    def set_cell(x,y,value)
      get_cell(x,y).value = value
    end
    
    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end
      
  end

end