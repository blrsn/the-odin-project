require_relative 'spec_helper.rb'
# require_relative '../lib/ruby_tic_tac_toe/cell.rb'
require 'rspec'
include RSpec

module RubyTicTacToe
  
  describe Board do
  # it "it can be initialized with a hash having grid key" do
#     expect {Board.new(grid: "grid")}.to_not raise_error
#   end
  
  it "has three rows by default" do
    board = Board.new
    expect(board.grid.size).to eq 3
  end
  
  it "has 3 thimgs in each row by default" do
    Board.new.grid.each do |row|
      expect(row.size).to eq 3
    end
  end
  
  # it "#get_cell" do
#     grid = [["","",""],["","","1*2"],["","",""]]
#     board = Board.new(grid: grid)
#     expect(board.get_cell(1,2)).to eq "1*2"
#   end
  
  it "#set_cell" do
     board = Board.new
     board.set_cell(0,0,"0*0")
     expect(board.get_cell(0,0).value).to eq "0*0"
   end
  
   it "returns :winner when winner? is true" do
     board = Board.new
     board.stub(:winner?).and_return(true)
     expect(board.game_over).to eq :winner
   end
   
   it "returns :draw when winner? is false and draw? is true"
   it "returns false when both winner? and draw are false"
   
   # it "returns true for same row same values" do
#      x_cell = Cell.new("x")
#      y_cell = Cell.new("y")
#      empty = Cell.new()
#      grid = [[x_cell,x_cell,x_cell],[x_cell,y_cell,x_cell],[y_cell,empty,y_cell]]
#      board = Board.new(grid: grid)
#      expect(board.winner?).to eq true
#    end
   
end

end