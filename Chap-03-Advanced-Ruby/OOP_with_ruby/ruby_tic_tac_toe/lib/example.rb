require_relative "ruby_tic_tac_toe.rb"
 
puts "Welcome to tic tac toe"
bob = RubyTicTacToe::Player.new({mark: "X", name: "bob"})
frank = RubyTicTacToe::Player.new({mark: "O", name: "frank"})
players = [bob, frank]
RubyTicTacToe::Game.new(players).play