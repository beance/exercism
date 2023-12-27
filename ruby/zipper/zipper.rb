# frozen_string_literal: true

Node = Struct.new(:value, :left, :right)

class Zipper
  def self.from_tree(tree)
    Zipper.new(tree, nil)
  end

  def to_tree
    up&.to_tree || tree
  end

  def value
    tree.value
  end

  def left
    tree.left && self.class.new(tree.left, method(:set_left))
  end

  def right
    tree.right && self.class.new(tree.right, method(:set_right))
  end

  def up
    @up ||= up_fun&.call(tree)
  end

  def set_value(value)
    update_tree(value, tree.left, tree.right)
  end

  def set_left(left)
    update_tree(tree.value, left, tree.right)
  end

  def set_right(right)
    update_tree(tree.value, tree.left, right)
  end

  def ==(other)
    tree == other.tree && up == other.up
  end

  protected

  attr_reader :tree, :up_fun

  def initialize(tree, up_fun)
    @tree = tree
    @up_fun = up_fun
  end

  def update_tree(value, left, right)
    self.class.new(Node.new(value, left, right), up_fun)
  end
end
