class NamesScores
  attr_reader :names
  def initialize
    @names = NamesScores.parse_names
  end 

  def self.parse_names 
    names = File.read("names.txt").split("\",\"")
    names[0] = names.first[1..-1]
    names[-1] = names.last[0..-2]
    names
  end

end 

