require_relative "../lib/interactor"
module Quiz

  describe Interactor do |variable|

    subject(:interactor) { Interactor.new }

    describe "#ask for yes or no" do
      it "should display the question" do
        expect(subject).to receive(:yn_prompt).and_return(false)
        expect{subject.ask?("example")}.to output("example\n").to_stdout
      end

      it "returns true for a y" do
        expect(subject).to receive(:yn_prompt).and_return(false)
        expect(subject.ask?("example question")).to eq(false)
      end

      it "returns false for a n" do
        expect(subject).to receive(:yn_prompt).and_return(true)
        expect(subject.ask?("example question")).to eq(true)
      end
    end

    describe "#yn_prompt" do
      it "should process user input, returning false for n" do
        expect(subject).to receive(:gets).and_return("n")
        expect(subject.yn_prompt).to eq(false)
      end

      it "should process user input, returning true for y" do
        expect(subject).to receive(:gets).and_return("y")
        expect(subject.yn_prompt).to eq(true)
      end

      it "should prompt again for an invalid value" do
        expect(subject).to receive(:gets).and_return("z","y")
        expect(subject.yn_prompt).to eq(true)
      end
    end

    describe "#validate_yn" do
      it "returns true for n" do
        expect(subject.validate_yn("n")).to eq(true)
      end

      it "returns true for y" do
        expect(subject.validate_yn("y")).to eq(true)
      end

      it "returns false for other values" do
        expect(subject.validate_yn("yyy")).to eq(false)
        expect(subject.validate_yn("")).to eq(false)
        expect(subject.validate_yn("e")).to eq(false)
      end
    end

    describe "#outputmessage" do
      it "should output a message" do
        expect{subject.output_message("example")}.to output("example\n").to_stdout
      end
    end

    describe "#Getting an answer" do
      it "should return the user input" do
        expect(subject).to receive(:output_message).with("question example")
        expect(subject).to receive(:gets).and_return("example")
        expect(subject.ask("question example")).to eq("example")
      end
    end


    describe "#Getting an answer" do
      it "should true on prompt" do
        expect(subject).to receive(:gets).and_return("y")
        expect(subject.yn_prompt).to eq(true)
      end
    end
  end
end
