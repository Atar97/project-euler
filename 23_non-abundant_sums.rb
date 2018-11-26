require "byebug"

class NonAbundantSums 
  attr_reader :abundants, :limit
  def initialize 
    @abundants = NonAbundantSums.abundants
    @limit = 28123
  end 

  def self.abundants
  end 

  def self.abundant?(n)
  end 

  def self.factors(n)
    i = 1 
    factors = []
    while i <= Math.sqrt(n)
      if n % i == 0 
        factors << i 
        factors << n / i if i != 1 && i != Math.sqrt(n) 
      end 
      i += 1
    end 
    factors
  end 

end 