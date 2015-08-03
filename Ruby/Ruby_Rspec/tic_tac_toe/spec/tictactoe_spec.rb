require 'spec_helper'
require 'cell'
require 'player'
require 'board'
require 'core_extensions'
require 'game'

describe RubyTicTacToe::Cell do
  
  let (:test) {RubyTicTacToe::Cell.new}
  it "is initialized to '' by default" do
    expect(test.value).to eq ''
  end
  
  it "return false for occupied when it has a value" do
    test.value = 'x'
    expect(test).to be_occupied
  end
  
  it "return false when not occupied " do  
    expect(test).not_to be_occupied
  end
  
end

describe RubyTicTacToe::Player do
  
  
  let (:player) {RubyTicTacToe::Player.new({name: "Berin",mark: "x"})}
  it "requires name and a mark" do

    expect(player.name).to eq "Berin"
    expect(player.mark).to eq "x"

  end
  
  it "true if mark is correct" do
    
    expect(player).to be_correct_mark
    
  end
  
  it "false if mark is not valid" do
    
    player.mark = 'z'
    expect(player).not_to be_correct_mark
    
  end
    
end

describe RubyTicTacToe::Board do
 
  let (:board) {RubyTicTacToe::Board.new}
  it "initializes a default grid" do
    ans = []
    board.grid.each do |row|
      row.each {|cell| ans << cell.value}
    end
    expect(ans).to eq ['','','','','','','','','']
  end
  
  it "sets cell and gets cell" do
    board.set_cell(0,0,'x')
    expect(board.get_cell(0,0).value).to eq 'x'
  end
  
  it "ends in tie when all cells are occupied" do
    board.grid.each do |row|
      row.each {|cell| cell.value = 'x'}
    end
    expect(board).to be_draw
  end
  
  it "is not tie when all cells are not occupied" do
    board.grid.each do |row|
      row.each_with_index {|cell,i| cell.value = 'x' if i != 2}
    end
    expect(board).not_to be_draw
  end
  
  it "wins when diagonals are occupied" do
    board.diagonals[0].each {|cell| cell.value = 'x'}
    expect(board).to be_winner
  end
  
  
end

describe RubyTicTacToe::Game do
  let (:player1) {RubyTicTacToe::Player.new({name: "berin",mark: "x"})}
  let (:player2) {RubyTicTacToe::Player.new({name: "larson",mark: "o"})}
  let (:arr) {[player1,player2]}
  
  
  it "selects player randomly" do
    allow_any_instance_of(Array).to receive(:shuffle).and_return([player1,player2])
    
    game = RubyTicTacToe::Game.new(arr)
    # game.players.stub(:shuffle) {[player2,player1]}
    expect(game.current_player).to eq player1
  end
  
  it "switches players correctly" do
    allow_any_instance_of(Array).to receive(:shuffle).and_return([player1,player2])
    game = RubyTicTacToe::Game.new(arr)
    game.switch_players
    expect(game.current_player).to eq player2
  end
  
end
    
    
  