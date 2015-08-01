require 'spec_helper'
require 'ceasar'

describe "ceaser cipher" do
  it "shifts the word by given number" do
    ceasar("hello", 5).should == "mjqqt"
  end
  
  it "shifts leaves out spaces and other punctuations" do
    ceasar("!@% $",5).should == "!@% $"
  end
  
  it "shifts by 25 gives the same" do
    ceasar("abcd",25).should == "abcd"
  end

  it "case is preserved" do
    ceasar("WXY",1).should == "XYZ"
  end
 
 it "shifts by 1 to goes to next" do
   ceasar("zzz",1).should == "aaa"
 end
 
end