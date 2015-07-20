#!/usr/bin/env ruby
require_relative '../lib/ruby_tic_tac_toe.rb'

puts "Welcome to RubyTicTacToe"

puts "Enter 1st player name"
p1 = gets.chomp
puts "Enter your mark"
m1 = gets.chomp

player1 = RubyTicTacToe::Player.new({name: p1,mark: m1})

puts "Enter 2nd player name"
p1 = gets.chomp
m2 = m1=="x" ? "o" : "x"

player2 = RubyTicTacToe::Player.new(name: p1,mark: m2)
input = [player1,player2]

my_game = RubyTicTacToe::Game.new(input)
my_game.play
