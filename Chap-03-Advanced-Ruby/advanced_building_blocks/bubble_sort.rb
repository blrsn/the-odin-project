def bubble_sort(array)
  
  @array = array
  
  passes = @array.length - 1
  
  passes.times do
    
    for i in 0...(passes)
      
      @point = i
    
      swap(@array[@point],@array[@point+1]) if @array[@point] > @array[@point+1] 
    
    end
    
  end
  
  @array
  
end

def swap(a,b)
  
  @array[@point]= b
  @array[@point+1] = a
  
end
  
  