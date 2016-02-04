require "spec_helper"

describe Game do |variable|

  subject(:game) {  described_class.new }

  describe '#GetUserInput' do

    it "Asks the user to make a move" do
      allow(subject).to receive(:gets).and_return("rock")
      expect{subject.get_user_input}.to output("Please enter rock, paper or scissors\n").to_stdout
    end
  end

  describe '#Generate a Response' do

    it "Confirms you have tied the round" do
      expect(subject.generate_response("rock", "rock")).to eq("rock:rock, tie!")
    end

    it "Confirms you have won the round" do
      expect(subject.generate_response("rock", "scissors")).to eq("rock:scissors, you win this round!")
    end

    it "Confirms you have lost the round" do
      expect(subject.generate_response("rock", "paper")).to eq("rock:paper, loooooosseeeerrrrrrrr!")
    end
  end

  describe '#Validation' do
  
    context "When a valid gesture" do
      it "You have selected rock" do
          expect(subject.make_a_move("rock")).to eq("You have selected rock")
      end
    end

   context 'When a invalid gesture' do
      it "BadMove is not a valid move, your options are rock, paper and scissors" do
        expect(subject.make_a_move("BadMove")).to eq("BadMove is not a valid move, your options are rock, paper and scissors")
      end
   end
  end
end

