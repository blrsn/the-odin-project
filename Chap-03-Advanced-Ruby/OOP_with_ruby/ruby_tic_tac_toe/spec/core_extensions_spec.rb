require_relative 'spec_helper.rb'
require 'rspec'
include RSpec

describe Array do
  it "all_empty on empty array returns true " do
    expect(['','',''].all_empty?).to eq true
  end
  
  it "all_empty returns false on nonempty array" do
    expect([1,2,''].all_empty?).to eq false
  end
  
  it "returns true for []" do
  expect([].all_empty?).to eq true
  end
  
  it "returns true for all same" do
    expect([1,1,1,1].all_same?).to eq true
  end
  
  it "returns false for arrays not have same elements" do
    expect([1,2,3,4].all_same?).to eq false
  end
  
  it "returns true for empty array" do
    expect([].all_same?).to eq true
  end
  
  it "none_empty returns true for [1,1,1,1]" do
    expect([1,1,11,1].none_empty?).to eq true
  end
  
end