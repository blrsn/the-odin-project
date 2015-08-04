require 'spec_helper'
require 'cell'
require 'player'
require 'board'

describe Cell do
  let (:test) {Cell.new}
  it "is initialized blank" do
    expect(test.value).to eq ''
  end
  
  it "returns true if occupied" do
    test.value = '1'
    expect(test).to be_occupied
  end
  
  it "returns false if not occupied" do
    expect(test).not_to be_occupied
  end
  
  # it "pos returns the position of the cell" do
 #    expect(test.pos).to eq 4
 #  end
  
end

describe Player do
  let (:test) {Player.new("Berin","1")}
  
  it "initialized with name and symbol" do
    expect(test.name).to eq "Berin"
    expect(test.symbol).to eq "1"
  end
  
end

describe Board do
  let (:board) {Board.new}
  
  it "is initialized with a default grid of length 42" do
    expect(board.grid.length).to eq 42
  end
  
  it "sets value to the first row" do
  allow_any_instance_of(Board).to receive(:gets).and_return("1\n")
  board.set_value("x")
  expect(board.grid[35].value).to eq "x"
  end
  
  it "keeps on stacking values" do
     allow_any_instance_of(Board).to receive(:gets).and_return("1\n","1\n","1\n","1\n")
     board.set_value("h")
     board.set_value("e")
     board.set_value("y")
     board.set_value("y")
     expect(board.grid[35].value).to eq "h"
     expect(board.grid[28].value).to eq "e"
     expect(board.grid[21].value).to eq "y"
     expect(board.grid[14].value).to eq "y"
   end
  
   it "only six values can be stacked in a column" do
     allow_any_instance_of(Board).to receive(:gets).and_return("1\n","1\n","1\n","1\n","1\n","1\n","1\n")
     board.set_value("g")
     board.set_value("o")
     board.set_value("o")
     board.set_value("d")
     board.set_value("b")
     board.set_value("a")
     expect(board.set_value("d")).to be_falsey
   end
    
     
end
    
    