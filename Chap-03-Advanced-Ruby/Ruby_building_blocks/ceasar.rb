def ceasar(str,shift)
  
  
  # a - z is 97 - 122
  # A - Z is 65 - 90
  
  str.length.times do |x|
    
    cipher = str[x].ord
    
      case cipher
        
      when 65..90
      
      actual_shift =  shift
      
        while cipher != 90 && actual_shift != 0
        
        cipher += 1  
        actual_shift -= 1
        # puts cipher
      
        end
        
        actual_shift = actual_shift % 25
        cipher = 64 + actual_shift if cipher == 90
        
        # puts "--#{cipher}"
    
        str[x] = cipher.chr 
      
      when 97..122
    
      actual_shift =  shift
    
        while cipher != 122 && actual_shift != 0
      
        cipher += 1  
        actual_shift -= 1
        
        # puts cipher
        end
        
        actual_shift = actual_shift % 25
        cipher = 96 + actual_shift if cipher == 122
    
        # puts cipher
        
        str[x] = cipher.chr 
        
      else
        "Do nothing"
      
      end
          
      
    end 
  
    str
    
end

puts ceasar("What a string!",5)
puts ""
  
  