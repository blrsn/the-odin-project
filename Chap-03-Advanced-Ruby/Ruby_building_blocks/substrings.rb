dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(string,dict)
  sub = Hash.new(0)
  len = string.length
  string = string.downcase
  
  len.times do |start|
    
    for final in (start...len) 
      
      round_str = string[start..final]
      
      # print "round_str #{round_str}    "
      
      sub[round_str] += 1 if dict.include? round_str
      
      # print "#{sub}\n"
      
      
    end
    
  end
  
  puts sub  
  
end


# substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)