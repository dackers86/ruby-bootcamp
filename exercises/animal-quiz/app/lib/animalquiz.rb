require_relative "game"

module Quiz
  class AnimalQuiz
    attr_accessor :game

    def initialize
        @game = Game.new()
    end

    def start_new_game
        @game.start
    end
  end
end

