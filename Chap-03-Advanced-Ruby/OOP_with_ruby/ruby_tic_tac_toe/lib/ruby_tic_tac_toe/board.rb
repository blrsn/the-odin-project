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
    
    def draw?
      arr = grid.flatten.map {|value| value}
      arr.none_empty?
    end
    
    def winning_pos
      grid + grid.transpose + diagonals
    end
    
    def diagonals
      [[get_cell(0,0),get_cell(1,1),get_cell(2,2)],
      [get_cell(0,2),get_cell(1,1),get_cell(2,0)]]
    end
    
    def winner?
      winning_pos.each do |cells| 
      return true if (pos_values_map(cells).all_same? && pos_values_map(cells).none_empty?)
      end
      false
    end
    
    def pos_values_map array
      array.map {|obj| obj.value}
    end
      
      
  end

end