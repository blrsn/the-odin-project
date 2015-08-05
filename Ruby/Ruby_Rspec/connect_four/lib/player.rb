class Player
  
  attr_accessor :name,:piece
  
  def initialize(arg_name)
    @name = arg_name.capitalize
  end
  
  def his_piece(p)
    @piece = p
  end
  
end