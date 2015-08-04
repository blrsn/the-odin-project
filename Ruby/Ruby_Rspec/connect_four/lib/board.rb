require_relative 'cell'

BLANK = "\u26AA"
BLACK = "\u26AB"
WHITE = "\u26BD"

class Board

  attr_accessor :grid
  
  def initialize
    @grid = Array.new(6){Array.new(7){Cell.new}}
    grid.each {|p| p.each {|g| g.value = BLANK}}
    
  end
  
  def show_grid
    puts "1  2  3  4  5  6  7"
    @grid.each do |row|
      row.each do |col|
        print "#{col.value}  "
        $stdout.flush
      end
      puts ""
    end
  end  
  
  def set_value(col,value)
    col = col.to_i - 1

    row = find_row(col)
    if row >= 0
      grid[row][col].value = value
      true
    else
      false
    end
  end

  def find_row(col)
    row = 5
    while row >= 0
      if grid[row][col].value == "\u26AA" 
         break
       else
         row -= 1
       end
    end
    row
  end

end

  # def win?(r,c,value)
  #   row = r
  #   col = c
  #
  #   row_limit = 5
  #   col_limit = 6
  #
  #   # straight 4 conditions
  # end
  #
  # def possible_4(r,c)
  #
      
    
    
    
  

if __FILE__ == $0
  board = Board.new
  
  board.grid[2][3].value = BLACK
  board.grid[5][0].value = WHITE

  board.show_grid
end