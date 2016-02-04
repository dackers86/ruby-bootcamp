require_relative "interactor"
require_relative "binary_tree"
require_relative "node"

module Quiz
  class Game
    attr_accessor :interactor
    attr_accessor :bst

    def initialize()
      @interactor = Interactor.new
      @bst = Bst.new(Node.new("Is it an elephant", :leaf))
    end

    def start
      while new_game? do
          start_new_game
        end
      end

      def start_new_game
        set_defaults
        ask_questions
        get_winner
      end

      def ask_questions
        until bst.leaf? do
          bst.next(answer)
        end
      end

      private

      def new_game?
        interactor.ask?("Play new game?")
      end

      def get_winner
        interactor.ask?(question) ? computer_wins_game : user_wins_game
      end

      def set_defaults
        bst.get_first_node
        interactor.output_message("Think of an animal...")
      end

      def answer
        interactor.ask?(question)
      end

      def question
        bst.node.statement
      end

      def user_wins_game
        interactor.output_message("You win. Help me learn from my mistakes before you go...")
        bst.update_binary_tree(bst.node)
      end

      def computer_wins_game
        interactor.output_message("I win. Pretty smart, aren't I?")
      end
    end
  end
