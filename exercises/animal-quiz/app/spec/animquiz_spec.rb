require_relative "../lib/animalquiz"
require_relative "../lib/game"

module Quiz

  describe AnimalQuiz do |variable|
    subject(:animalquiz) { AnimalQuiz.new }
    let(:example_game) { Game.new }
  end
end