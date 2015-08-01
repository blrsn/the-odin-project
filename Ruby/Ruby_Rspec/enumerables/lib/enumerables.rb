module Enumerable
  def my_each
    i = 0
    loop do
        
      yield self[i]
      i += 1
      break if i == self.length
      
    end
  end
  
  def my_each_with_index
    i = 0
    self.my_each do |ele|
    
    yield ele,i
    i += 1
    
    end
  end
  
  def my_select
     
    ans = []
    self.my_each do |ele|
      
      ans << ele if yield(ele)
      
    end
    ans
  end 
  
  def my_all?
    
    ans = true
    self.my_each do |ele|
      if block_given?
        ans = ans && yield(ele)
      else
        ans = ans && (ele != nil || false)
      end
    end
    ans
  end
  
  def my_any?
    
    ans = false
    self.my_each do |ele|
      if block_given?
        ans = ans || yield(ele)
      else
        ans = ans || (ele != nil && ele != false)
      end
    end
    ans
  end
  
  def my_map
    ans = []
    
    self.my_each do |p|
      if block_given?
        ans << yield(p)
      else
        ans << p
      end
    end
    
    ans
  end
  
end