class Code
  attr_reader :value
  
  def set_code input
    
    @value = input
    
  end
  
  def hits guess # takes array and returns exact hits
    count = 0
    value.each_with_index {|ele,i|  if ele==guess[i] then count +=1 end}
    count
  end
  
  def close guess # takes array and returns close calls
    count = 0
    value.each_with_index do |ele,i|
       if ele+1 == guess || ele-1 == guess
         count +=1
     end
     count
  end
  
  
  
end


if __FILE__ == $0
  
  the_code = Code.new
  the_code.set_code 1234
  p the_code.value
  
end