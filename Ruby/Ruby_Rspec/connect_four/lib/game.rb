require './board'
require './player'
require 'pry'

class Game
  
  attr_accessor :player1,:player2,:board
  def initialize
    @board = Board.new
    
  end
  
  def save_game(player1,player2,board)
    File.open("save.csv",'a') do |file|
      board_str = board.columns.map {|row| row.join.ljust(7,' ')}.join('|')
      writer = [player1.name,player1.piece,player2.name,player2.piece,board_str] 
      file << writer.join(',') + "\n"
    end
  end
  
  def load_game
    File.open("save.csv") do |file|
      load = []
      arr = file.readlines
      arr.each do |line|
        load << line.split(',')
      end
      loaded_arr = []
      load.each do |saved|
        loaded_arr = Board.new(board: saved[4].chomp)
      end
      # binding.pry
    end
  end
  
  def switch_players
    @player1,@player2 = @player2,@player1
  end
  
  def play(player1,player2)
    
    loop do
      puts "#{player1.name}, Enter your column. Enter 'save' to save game" 
      puts board.to_s
      saved = false
      
      while true
        inp = gets.chomp
        
        if inp == "save"
          save_game(player1,player2,board)
          saved = true
          puts "save successfull"
          break
          
        elsif inp.match(/^[0-6]$/) && board.columns[inp.to_i].length < 6  
          break
        else
          if !board.columns[inp.to_i].nil?
          puts "column #{inp} is full" if board.columns[inp.to_i].length == 6 
          end
          puts "Please enter a valid input"
        end
      end 
      
      break if saved
      board.place!(inp.to_i,player1.piece)
      
      if board.winner
        puts "#{player1.name} won"
        puts board.to_s
        break
      end
      
      player1,player2 = player2,player1
      
    end
      
      
  end
    
  
end

if __FILE__ == $0
  
  while true
    
    game = Game.new
  
    puts "1. Play new game"
    puts "2. Load game"
    puts "3. Exit"
  
    begin
      option = gets.chomp.match(/^[1-3]$/)[0]
    rescue StandardError => e
      puts "Please enter a valid choice(1 - 3)"
      retry
    end
    
    case option
    when "1"
    puts "Enter player1 name"
    name1 = gets.chomp
    player1 = Player.new(name1)
    player1.his_piece("\u26AB")
  
    player1.name = name1
    puts "Enter player2 name"
    name2 = gets.chomp
  
    player2 = Player.new(name2)
    player2.his_piece("\u26BD")
  
    when "2"
      game.load_game
    
    when "3"
      break
    
    end
  
  
    puts "#{player1.name}, your piece is #{player1.piece}"
    puts "#{player2.name}, your piece is #{player2.piece}"  
  
    game.play(player1,player2)
  
end
  
end

