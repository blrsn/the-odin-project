class Array
  
  def all_empty?
  
    self.all? {|ele| ele.to_s.empty?}
    
  end
  
  def all_same?
    
    self.all? {|ele| ele == self[0]}
    
  end
  
  def any_empty?
    
    self.any? {|ele| ele.to_s.empty? }
    
  end
  
  def none_empty?
    
    !any_empty?
    
  end
  
end