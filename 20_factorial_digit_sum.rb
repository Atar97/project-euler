class FactorialDigitSum
  def self.factorial(n)
    n.downto(1).reduce(:*)
  end

  def initialize(n)
    @factorial = self.class.factorial(n)
  end 

  def self.digital_root(n)
    return n if n < 10 
    FactorialDigitSum.digital_root(n % 10 + FactorialDigitSum.digital_root(n / 10)) 
  end 

  def self.sum_digits(n)
    return n if n < 10 
    n % 10 + self.sum_digits(n / 10) 
  end 

  def solve 
    self.class.sum_digits(@factorial)
  end   
end 

puts FactorialDigitSum.factorial(10)
puts FactorialDigitSum.factorial(5)
f = FactorialDigitSum.new(100) 
puts f.solve