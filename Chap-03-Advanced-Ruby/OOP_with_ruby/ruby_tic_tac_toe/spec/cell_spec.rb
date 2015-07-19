require_relative 'spec_helper.rb'
require 'rspec'
include RSpec

module RubyTicTacToe
  describe Cell do
    
    context "#initialize" do
      
      it "initialized to '' by default" do
      cell = Cell.new
      expect(cell.value).to eq ""
      end
      
      it "initialize to x when passed" do
      cell = Cell.new("x")
      expect(cell.value).to eq "x"
      end
    
    end
    
  end
  
end