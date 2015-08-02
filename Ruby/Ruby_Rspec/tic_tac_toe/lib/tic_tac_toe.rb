#!/usr/bin/env ruby
require_relative 'ruby_tic_tac_toe.rb'

puts "Welcome to Ruby Tic Tac Toe"

puts "Enter 1st player name"
p1 = gets.chomp.capitalize

while true
 
puts "Enter your mark. Select from these options ('x' 'o' 'X' 'Y')"
m1 = gets.chomp.capitalize

player1 = RubyTicTacToe::Player.new({name: p1,mark: m1})
break if player1.correct_mark?

end

puts "Enter 2nd player name"
p1 = gets.chomp.capitalize
m2 = m1=="X" ? "O" : "X"


player2 = RubyTicTacToe::Player.new(name: p1,mark: m2)

puts "\nWelcome #{player1.name} and #{player2.name}"
puts "Player1: #{player1.name} \t\tMark: #{player1.mark}"
puts "Player2: #{player2.name} \t\tMark: #{player2.mark}\n\n"

input = [player1,player2]

my_game = RubyTicTacToe::Game.new(input)
my_game.play
