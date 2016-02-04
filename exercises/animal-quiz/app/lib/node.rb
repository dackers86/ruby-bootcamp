module Quiz
  class Node
    attr_accessor :yes_node
    attr_accessor :no_node
    attr_accessor :type
    attr_accessor :statement
    attr_accessor :parent_node

    def initialize(statement, type)
      @statement = statement
      @type = type
    end

    def add(statement, type, side)
      if side == :yes
        @yes_node = Node.new(statement, type)
        @yes_node.parent_node = self
      else
        @no_node = Node.new(statement, type)
        @no_node.parent_node = self
      end
      self
    end

    def is_valid?
      @node.isnil?
    end
  end
end
