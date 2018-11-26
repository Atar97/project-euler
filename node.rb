require "byebug"

class Node 
  attr_accessor :parent, :children, :max_path_sum
  attr_reader :value

  def initialize(value, children: [], parent: nil)
    @value = value
    @children = children
    @parent = parent
    @max_path_sum = 0
  end

  def add_child(child_node) 
    child_node.delete_parent
    child_node.parent = self 
    if self.children.include?(child_node)
      raise "already a child"
    end 
    self.children << child_node
  end 

  def set_parent(parent_node) 
    parent_node.add_child(self)
  end 

  def delete_child(child_node) 
    children.delete(child_node)
  end 

  def to_s
    childs = children.map do |child| 
      child.value 
    end 
    childs = ["none"] if childs.empty?
    "\t#{value}\nchildren = #{childs.join(",")}"
  end 

  def delete_parent
    if self.parent 
      self.parent.children.delete(self)
      self.parent = nil
    end 
  end 
end 

root = Node.new(0)
node1 = Node.new(1)
node2 = Node.new(2)
node3 = Node.new(3)
node4 = Node.new(4)
node5 = Node.new(5)
root.add_child(node1)
root.add_child(node2)
node2.add_child(node3)
node2.add_child(node4)
node3.add_child(node5)
node4.add_child(node5)
