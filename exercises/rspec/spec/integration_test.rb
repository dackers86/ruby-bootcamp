require "spec_helper"

describe Game do |variable|

  subject(:game) {  described_class.new }

    describe '#IntegrationTest' do

    it "When a round has been completed" do
      allow(subject).to receive(:gets).and_return("rock")
      expect{subject.get_user_input}.to output("Please enter rock, paper or scissors\n").to_stdout
    end
  end
end