class NamesScores
  attr_reader :names
  def initialize
    @names = NamesScores.parse_names
    @names.sort!
  end 

  def self.parse_names 
    names = File.read("names.txt").split("\",\"")
    names[0] = names.first[1..-1]
    names[-1] = names.last[0..-2]
    names
  end

  def self.name_score(name) 
    name.chars.reduce(0) { |acc, char| acc + char.ord - 64 }
  end 

  def score
    result = 0
    names.each_with_index do |name, idx|
      result += NamesScores.name_score(name) * (idx + 1)
    end 
    result
  end 

end 

n = NamesScores.new 
puts NamesScores.name_score("COLIN")
puts n.score

