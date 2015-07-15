def ceasar(str,shift)
  
  #array = str.split("")
  
  str.length.times do |x|
    
    str[x] = (str[x].ord + shift).chr
    
  end
  
  str
  
end
  
  