def ceasar(str,shift)
  
  #Cases to be considered
  # a - z is 97 - 122
  # A - Z is 65 - 90
  #everything else
  
  shift = shift % 25 # reduces shifts greater than 25 
  
  str.length.times do |x|
    
    cipher = str[x].ord
    
      case cipher
        
      when 65..90  # handles Upper case letters
      
      actual_shift =  shift #copy of the original shift which will be modified in the loop
       
      
        while cipher != 90 && actual_shift != 0 #condition to check reach of last valid char && check end of actual shift
        
        cipher += 1  
        actual_shift -= 1
      
        end
        
        
        cipher = 64 + actual_shift if cipher == 90 #add remaining shifts to the 1st valid char
    
        str[x] = cipher.chr 
      
      when 97..122 #handles lower case letters
    
      actual_shift =  shift
    
        while cipher != 122 && actual_shift != 0
      
        cipher += 1  
        actual_shift -= 1
        
        end
        
        cipher = 96 + actual_shift if cipher == 122
    
        
        str[x] = cipher.chr 
        
      else # handles everything other than char
        
        "Do nothing"
      
      end
          
      
    end 
  
    str
    
end

puts ceasar("What a string!",5)
puts  ceasar("zzz",24)
  
  