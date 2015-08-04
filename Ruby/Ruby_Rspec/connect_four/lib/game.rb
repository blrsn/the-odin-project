require_relative 'cell'
require_relative 'board'
require_relative 'player'

if __FILE__ == $0
  board = Board.new
  player1 = Player.new("Berin","\u26BD")
  player2 = Player.new("larson","\u26AB")
  current_player,other_player = [player1,player2]
  
  puts "player1 symbol is #{player1.symbol}"
  puts "player2 symbol is #{player2.symbol}"
  
  board.show_grid
  
  loop do
    puts "#{current_player.name} enter ur digit"
    col = gets.chomp
    next if !board.set_value(col,current_player.symbol)
    board.show_grid
    current_player,other_player = other_player,current_player
  end
    
  
  
end