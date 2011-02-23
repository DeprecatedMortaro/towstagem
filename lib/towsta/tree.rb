module Towsta
  class Tree

    attr_accessor :parent, :item, :left, :right

    def initialize element
      @item = element
    end

    def add element
      item.id > element.id ? ( @right ? @right.add(element) : add_right(Tree.new(element))) : (@left ? @left.add(element): add_left(Tree.new(element)))
    end

    def add_left tree
      @left = tree
      tree.parent = self
    end

    def add_right tree
      @right = tree
      tree.parent = self
    end

    def find id
      return self if item.id == id
      return @right.find id if item.id > id && @right
      return @left.find id if @left
    end

  end
end
