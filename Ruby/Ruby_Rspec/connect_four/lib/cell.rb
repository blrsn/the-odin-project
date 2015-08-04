class Cell
  
  # @@count = 1
  attr_accessor :value,:pos
  def initialize
    @value = ""
    # @pos = @@count
#     @@count += 1
  end
  
  def occupied?
    if @value != ""
      return true
    else
      false
    end
  end
  
  def empty?
    if value == "\u26AA"
      true
    else
      false
    end
  end
  
  def same_value?(val)
    if value == val
      true
    else 
      false
    end
  end
      
  
end