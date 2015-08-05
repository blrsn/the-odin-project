require 'pry'

class Board
  
  DIRECTIONS = [[1,0],[0,1],[1,1],[-1,1],[-1,0],[0,-1],[-1,-1],[1,-1]]
  
  attr_accessor :columns
  def initialize(args = {})
    @width = args[:width] || 7
    @height = args[:height] || 6
    board_str = args.fetch(:board,nil)
    
    if board_str
      @columns = Array.new(@width){Array.new(@height) { nil }}
      
      #setting up board using board value supplied
      board_arr = board_str.split("").map {|row| row.split('')}
      binding.pry
      
      board_arr = board_arr.transpose
      
      @columns = @columns.map.each_with_index do |col,index|
        board_arr[index].select {|p| p != " " }
      end
    else
      @columns = Array.new(@width){ [] }
      
    end
    # puts @columns
  end
  

  def place!(col,piece)
    @columns[col].push(piece)
  end
  
  def to_s
    table = (@height - 1).downto(0).map do |row|
      ' ' + @columns.map {|column| column[row] ? column[row] : "\u26AA"}.join(' ') + ' '
    end.join("\n")
    table + "\n " + (0...@width).inject('') {|sum,num| sum + " #{num.to_s}"} + " \n"
  end
  
  def line(col,row,direction)
    if cell(col,row).nil?
      return false
    else
     visited = [cell(col,row)] 
     
       3.times do
         col += direction.first
         row += direction.last
         visited << cell(col,row)
      end
    end
    
    return visited.first if visited.all? {|cell| cell == (visited.first)}
  end
      
      
  def cell(col,row)
    return nil if col < 0 || col >= @width || row < 0 || row >= @height
    @columns[col][row]
  end 
  
  def winner
    (0..@height).each do |row|
      (0..@width).each do |col|
        DIRECTIONS.each do |dir|
          winner = line(row,col,dir)
          return winner if winner
        end
      end
    end
    nil
  end
  
  
  
end



# if __FILE__ == $0
#   board = Board.new
#   puts "column array #{board.columns}"
#   puts board.to_s
#   board.place!(0,'x')
#   board.place!(0,'x')
#   board.place!(1,'y')
#   board.place!(1,'y')
#   p board.columns
#
# end
