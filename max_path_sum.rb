require_relative "node"

class MaxPathSum
  TRIANGLE = "75
              95 64
              17 47 82
              18 35 87 10
              20 04 82 47 65
              19 01 23 75 03 34
              88 02 77 73 07 63 67
              99 65 04 28 06 16 70 92
              41 41 26 56 83 40 80 70 33
              41 48 72 33 47 32 37 16 94 29
              53 71 44 65 25 43 91 52 97 51 14
              70 11 33 28 77 73 17 78 39 68 17 57
              91 71 52 38 17 14 91 43 58 50 27 29 48
              63 66 04 68 89 53 67 30 73 16 69 87 40 31
              04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
  attr_reader :triangle

  def initialize
    @triangle = self.class.parse
  end

  def self.parse 
    TRIANGLE.split("\n").map do |row| 
      row.split(" ").map { |num| num.to_i }
    end
  end 

  def solve 
    triangle.map!.with_index do |row, row_idx| 
      if row_idx == 0
        row 
      else 
        MaxPathSum.solve_row(row, triangle[row_idx - 1])
      end 
    end 
  end 

  def self.best_above(my_idx, row_above)
    left = row_above[my_idx - 1].to_i
    right = row_above[my_idx].to_i
    [left, right].max
  end 

  def self.solve_row(row, row_above)
    row.map!.with_index do |element, idx| 
      element += MaxPathSum.best_above(idx, row_above)
    end 
  end 

  def render  
    triangle.each_with_index {|row, idx| p "#{idx}: #{row}"}
  end 
end 

t = MaxPathSum.new 
t.render
t.solve
t.render
puts t.triangle.last.max