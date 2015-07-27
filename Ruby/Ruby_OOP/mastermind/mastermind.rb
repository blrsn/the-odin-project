class Mastermind
  CODE_LENGTH = 4
  attr_reader :code
  
  def set_code 
    @code = []
    CODE_LENGTH.times {|t| @code << rand(1..6)}
  end


end

if __FILE__ == $0
  master = Mastermind.new
  master.set_code
  p master.code
end