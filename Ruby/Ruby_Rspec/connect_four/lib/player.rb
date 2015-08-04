class Player
  attr_accessor :name,:symbol
  
  def initialize(name,symbol)
    @name = name.capitalize
    @symbol = symbol
  end
  
end
    