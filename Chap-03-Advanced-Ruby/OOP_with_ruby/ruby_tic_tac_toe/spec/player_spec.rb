require_relative 'spec_helper.rb'
require 'rspec'
include RSpec

module RubyTicTacToe
  
    describe Player do
      it "initialized with name and mark" do
        input = {:name => "Berin",:mark =>"x" }
        player1 = Player.new(input)
        expect(player1.name).to eq input[:name]
        expect(player1.mark).to eq input[:mark]
      end
      
      it "raises an exception when initialized with {}" do
        expect {Player.new({})}.to raise_error
      end
      
    end
    
  
  
  
end