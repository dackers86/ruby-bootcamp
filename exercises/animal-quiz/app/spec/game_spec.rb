require_relative "../lib/interactor"
require_relative "../lib/game"
require_relative "../lib/binary_tree"

module Quiz

  describe Game do

    subject(:game) { Game.new() }

    before(:each) do
      subject.bst.node.add("does it have long arms?", :branch, :yes)
      subject.bst.node.yes_node.add("Is it a monkey?", :leaf, :yes)
      allow(subject.interactor).to receive(:output_message)
    end

    describe "#Game Management" do

      it "should bot have an empty Binary search tree" do
        expect(subject.bst.node.statement).not_to be_empty
      end

      it "Should restart a new game when requested" do
        allow(subject.interactor).to receive(:ask?).and_return(false)
        expect(subject).to receive(:start).once
        subject.start
      end

      it "Should play again" do
        allow(subject.interactor).to receive(:ask?).and_return(true, true, false)
        expect(subject).to receive(:start_new_game).at_least(2).times
        subject.start
      end

      it "Should start with the first element in the binary tree" do
        allow(subject).to receive(:ask_questions).and_return(subject.bst.node)
        allow(subject.interactor).to receive(:ask?).and_return(true, true, false)
        expect(subject.bst).to receive(:get_first_node)
        subject.start
      end
    end

    describe "#Guessing" do

      before(:each) do
        allow(subject.interactor).to receive(:ask)
        allow(subject.interactor).to receive(:ask?).with("Play new game?")
                         .and_return(false)
      end

      it "should win if correct" do
        allow(subject.interactor).to receive(:ask?).and_return(true, true, false)
        expect(subject).to receive(:computer_wins_game)
        subject.start
      end

      it "should lose if incorrect" do
        allow(subject.interactor).to receive(:ask?).and_return(true, false, false)                        
        expect(subject).to receive(:user_wins_game)
        subject.start
      end

      it "should repeat until it has an answer" do
        allow(subject.interactor).to receive(:ask?).and_return(true)
        subject.ask_questions
        expect(subject.bst.node.type).to eq(:leaf)
        expect(subject.bst.node.statement).to eq("Is it an elephant")
      end

    end

    describe "#user_wins_game" do

      before(:each) do
        allow(subject.interactor).to receive(:ask?).and_return(true)
        allow(subject.interactor).to receive(:ask).and_return("ExampleQuestion", "ExampleAnswer")

        subject.bst = Bst.new(Node.new("Is it an elephant", :leaf))
        subject.bst.node.add("does it have long arms?", :branch, :yes)
      end
    end
  end
end
