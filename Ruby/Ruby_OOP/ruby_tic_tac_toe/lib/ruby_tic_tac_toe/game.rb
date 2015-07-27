module RubyTicTacToe

  # class Game has players
  # has 2 states - current_player, other_player, board
  #-------initialization
  # game1 = Game.new([player_obj,player_obj])
  # current & other player are initialized using input array having 2 player obj
  # board is defaulted to new Board instance 


  class Game
    
    attr_reader :players, :board, :current_player , :other_player
    def initialize(players,board = Board.new)
      # @players = players
      @board = board
      @current_player , @other_player = players.shuffle
    end
  
  def switch_players   #--switches the states current_player and other_player
    @current_player, @other_player = @other_player, @current_player
  end
  
  def solicit_move    #--asks current player to enter a number
    "#{current_player.name}: Enter a number between 1 and 9 to make your move"
  end
  
  def get_move(human_move = gets.chomp) #--gets the fixnum between 1 to 9 and calls human_move_to_coordinatess
    human_move_to_coordinate(human_move)
  end
 
  def human_move_to_coordinate(human_move) #--maps numbers to coordinates
    mapping = {
      "1" => [0, 0],
      "2" => [0, 1],
      "3" => [0, 2],
      "4" => [1, 0],
      "5" => [1, 1],
      "6" => [1, 2],
      "7" => [2, 0],
      "8" => [2, 1],
      "9" => [2, 2]
    }
    mapping[human_move]
  end
  
  def game_over_message #--calls board method game_over to check if game is over
    return "#{current_player.name} won!" if board.game_over == :winner
    return "The game ended in a tie" if board.game_over == :draw
  end
  
  def play #--actual gameplay
    puts "#{current_player.name} has randomly been selected as the first player"
    while true
      board.formatted_grid # shows grid
      puts ""
      puts solicit_move # asks user for a move
      x, y = get_move # get_move returns co-ordinates
      board.set_cell(x, y, current_player.mark) # sets the co-ordinates to the players mark
      if board.game_over # check if game is over
        puts game_over_message
        board.formatted_grid
        return
      else
        switch_players # switch players and repeat if game is not over
      end
    end
  end
  
end
  
end