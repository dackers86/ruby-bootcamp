require_relative "interactor"
module Quiz
  class Bst
    attr_accessor :node
    attr_accessor :interactor

    def initialize(init_node)
      @intial_node = init_node
      @node = init_node
      @interactor = Interactor.new
    end

    def next(respond)
      next_node = respond ? @node.yes_node : @node.no_node

      if(next_node.nil?)
        next_node = Node.new(nil, :branch)
        next_node.parent_node = @node
      end 

      @node = next_node
    end

    def get_first_node
      while !@node.parent_node.nil? do
         @node = @node.parent_node
      end
    end

    def leaf?
      @node.type == :leaf
    end

    def update_binary_tree(node)
      node.add(animal, :leaf, response? ? :yes : :no)

      node.add(node.statement, :leaf, response? ? :no : :yes)
      node.statement = question
      node.type = :branch
    end

    private

    def response?
      @response = @interactor.ask?("Answer to question?")
    end

    def question
      @interactor.ask("Give me a question to distinguish #{animal} from #{node.statement}?")
    end

    def animal
      @animal ||= @interactor.ask("What animal were you thinking of?")
    end
  end
end