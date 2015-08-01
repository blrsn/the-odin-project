require 'spec_helper'
require 'enumerables'

describe 'enumerbles' do
  
  let (:array) {[1,2,3]}
  let (:ans){[]}
  
  describe "my_each" do
    it "cycles through all elements" do
      array.my_each {|p| ans << p}
      expect(ans).to eq array
    end
  end
  
  describe "my_each_with_index" do
    it "cycles through all elements and indices" do
    array.my_each_with_index {|ele,ind| ans << [ele,ind] }
    expect(ans).to eq [[1,0],[2,1],[3,2]]
    end
  end
  
  describe "my_select" do
    it "selects only blocks which return true" do
    ans = array.my_select {|p| p == 3}
    expect(ans).to eq [3]
    end
  end
  
  describe "my_all?" do
    context "when block is given" do
      it "returns true if all elements satisfy a condition " do
      array = [2,4,6,8]
      expect(array.my_all? {|p| p%2 == 0}).to eq true
      end
    end
    
    context "when no block given" do
      it "returns true if no nil or false" do
      arr = [1,2,3,4]
      expect(arr.my_all?).to eq true
      end
      
      it "returns false when nil is present in an array" do
      arr = [1,2,nil,5,false]
      expect(arr.my_all?).to eq false
      end
    end
    
  end
  
  describe "my_any?" do
    context "when block is given" do
      it "returns true if any satisfy the condition" do        
      arr = [1,2,3,4]
      expect(arr.my_any? {|p| p == 3 }).to eq true
      end
    end
    
    context "when no block given" do
      it "returns true if any of the element is not nil" do
        arr = [nil,nil,1]
        expect(arr.my_any?).to eq true
      end
      
      it "returns false if all elements are nil or false" do
        arr = [nil,false,nil]
        expect(arr.my_any?).to eq false
      end
    end
  end
  
  describe "my_map" do
    context "when block is given" do
      it "returns the array with changes" do
        arr = [1,2,3]
        ans = arr.my_map{|p| p+1}
        expect(ans).to eq [2,3,4]
      end
    end
    
    context "when no block is given" do
      it "returns the same array when no block is given" do
        arr = [1,2,3]
        expect(arr.my_map).to eq arr
      end
    end
  end
    
end