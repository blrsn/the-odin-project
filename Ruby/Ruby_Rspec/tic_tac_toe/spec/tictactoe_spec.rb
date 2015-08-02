require 'spec_helper'
require 'cell'
require 'player'

describe RubyTicTacToe::Cell do
  
  it "is initialized to '' by default" do
    test = RubyTicTacToe::Cell.new
    test.value.should == ''
  end
  
  it "return false for occupied when it has a value" do
    test = RubyTicTacToe::Cell.new
    test.value = 'x'
    test.should be_occupied
  end
  
  it "can be given value only x or X || o or O " 
  
end

describe RubyTicTacToe::Player do
  
  it "requires name and a mark" do
    
    player = RubyTicTacToe::Player.new({name: "Berin",mark: "x"})
    player.name.should == "Berin"
    player.mark.should == "x"
    
  end
  
  it "true if mark is correct" do
    
    player = RubyTicTacToe::Player.new({name: "Berin",mark: "x"})
    player.should be_correct_mark
    
  end
  
  it "false if mark is not valid" do
    
    player = RubyTicTacToe::Player.new({name: "Berin",mark: "z"})
    player.should_not be_correct_mark
    
  end
    
end
    
    
  