module Enumerable
  
  def my_each # yields each element to the block and returns the entire array
    
    i = 0
      while i != self.length
        yield(self[i])
        i += 1
      end
    self
    
  end
  
  def my_each_with_index #yields each element and index
    
    i = 0
      while i != self.length
        yield(self[i],i)
        i += 1
      end
      self
    
    end
    
    
  def my_select #returns an array only with elements that satisfy the condition in the block
    ans = []
    self.my_each do |t|
      
      ans << t if yield(t)
      
    end
    ans
  end
    
  def my_all? # returns true if all elements satisfy the condition in block
    bool = true
    self.my_each do |ind|
   
      if block_given?
      bool = bool && yield(ind)
      else
      bool = bool && (ind != nil || false)
      end
  
    end
    bool
  end

  def my_any? # returns true if any element satisfy condition in block
    bool = false
    self.my_each do |ind|
    
      if block_given?
        bool = bool || yield(ind)
      else
        bool = bool || (ind != nil || false)
      end
    
    end
    bool
  end


  def my_none? #returns true if any of the elements satisfy the condition
    bool = true
    self.each do |ind|
    
      if block_given?
        bool = bool && !(yield(ind))
      else
        bool = bool  || (ind != nil || false)
      end
    end
    bool
  end

  def my_count(arg = nil) 
    # 3 cases
    # With block - counts the number of times the condition in block becomes true
    # With argument - counts number of elements of the array which are equal to arg
    # Nothing - gives length of the array 
    count = 0
    self.each do |ind|
    
      if block_given?
        count += 1 if yield(ind)
      elsif arg == nil
        count += 1
      else
        count +=1 if ind == arg
      end
    
    end
       count 
  end

  def my_map #returns an array with changes performed by the block in each element
    #incase of no block - actual array is returned
    ans = []
    self.my_each do |ind|
      if block_given?
        ans << yield(ind)
      else
        ans << ind
      end
    end
    ans
  end
  
  def my_map_proc(code)
    ans = []
    self.my_each do |ind|
      ans << code.call(ind)
    end
    ans
  end
  
   def my_map_final(code = nil)
    ans = []
     
    if code && block_given?
      self.my_each do |n|
        ans << code.call(yield(n))
      end
    elsif code.nil? && block_given?
      self.my_each do |n|
        ans << yield(n)
      end
    elsif code && !(block_given?)
      self.my_each do |n|
        ans << code.call(n)
      end
    else
      ans = self
    end
    ans
  end
  
  def my_inject(arg = 0)
  		self.my_each do |n|
  			arg = (yield arg, n)
  		end
  		arg
  	end
        
end

def multiply_els(arr)
  arr.my_inject(1){|sum,n| sum*n}
end




if __FILE__ == $0
  a = [1,2,2,5,8]
  # p a.my_all? {|t| t>5}
#   p a.my_any? {|t| t>5}
#   p a.my_none?
#   p "---"
#   p a.my_map {|t| t+4}
#   plus4 = Proc.new do |t| t+4 end
#   p a.my_map_proc(plus4)
#   p a.my_count
#   p a.my_inject(1) {|sum,n| sum * n}
#   p  multiply_els([2,4,5])
  star_proc = Proc.new do |t| "#{t}**" end
  
  p "only block"
  p a.my_map_final{|num| num + 10}
  p "both block and proc"
  p a.my_map_final(star_proc) {|num| num + 10}
  p "only proc"
  p a.my_map_final(star_proc)
  p "no block and no proc"
  p a.my_map_final
end