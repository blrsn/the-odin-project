module RubyTicTacToe

# class Board with 1 state - (grid which is an array)
# grid defaults to  [[cell.cell,cell],[cell.cell,cell],[cell.cell,cell]]
# Board has a no. of behaviours or methods  


  class Board 
    attr_accessor :grid
    
    #-- initialization methods  
    def initialize
      @grid = default_grid
    end
    
    
    def default_grid
      Array.new(3) {Array.new(3){Cell.new}}
    end
    
    
    #-- get_cell and set_cell methods
    def get_cell(x,y)
      grid[x][y]
    end
    
    def set_cell(x,y,value)
      get_cell(x,y).value = value
    end
    
    #--methods to check game over
    def game_over
      return :winner if winner?
      return :draw if draw?
      false
    end
    
    def draw?  # less complex draw? method which declares draw if all elements in array is filled
      arr = grid.flatten.map {|cell| cell.value}
      arr.none_empty?
    end
    
    def winner? # each array in winning_pos is checked if all are same
      winning_pos.each do |one_of_8| 
      return true if (obj_to_values(one_of_8).all_same? && obj_to_values(one_of_8).none_empty?)
      end
      false
    end
    
    def winning_pos # winning pos is array with 8 nested arrays
      #which means there are 8 possible winning pos
      grid + grid.transpose + diagonals
    end
    
    def diagonals
      [[get_cell(0,0),get_cell(1,1),get_cell(2,2)],
      [get_cell(0,2),get_cell(1,1),get_cell(2,0)]]
    end
    
    
    
    def obj_to_values array #--takes array with cell objects and returns array with their values 
      array.map {|obj| obj.value}
    end
    
    def formatted_grid #--shows current state of the grid array - graphical
          grid.each do |row|
            puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join(" ")
          end
    end
      
      
  end

end