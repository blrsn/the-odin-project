def ceasar(string,num)
  
  num = num % 25 if num >= 25
  
  string_arr = string.split('') # splitting input string into array
  
  ans = string_arr.map do |elem|  # mapping the answers to array
    
    elem = elem.ord # converting to ASCII values using ord
    
    shift = num 
    
    case elem      # 3 cases to be considered 
      
    when 65..90
      loop do |t|
        
        break if elem == 90 || shift == 0
        elem += 1
        shift -= 1
        
      end
      
      elem = 64 + shift if shift != 0
      
    when 97..122
      loop do |t|
        
        break if elem == 122 || shift == 0
        elem += 1
        shift -= 1
        
      end
      
      elem = 96 + shift if shift != 0
    end
      
      
      elem.chr  
      
  end
  ans.join
 end

