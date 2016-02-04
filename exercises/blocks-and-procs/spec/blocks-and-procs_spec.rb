require "spec_helper"

describe Wait do |variable|

  subject(:wait) {  described_class.new }

  describe '#Looping through the input ' do

    def setup
      stub(Kernel).sleep
    end

    # it "returns if a true values has been provided" do
    #   expect(subject).to receive(:until).and_return(true)
    #   subject.until(1, 1){ true }
    # end

    # it "loops until a true values has been provided" do
    #   expect(subject).to receive(:until).and_return(true)
    #   subject.until(1, 1){ rand(9999) % 2 == 0 }
    # end

    # it "delays the execution by a specified time in seconds" do
    #   expect(subject).to receive(:sleep).with(1)
    #   i = 0
    #   subject.until(1, 1) do 
    #     i+=1
    #     i >1
    #   end
    # end


    # it "should exit after the specified time in seconds" do
    #   expect(subject).to receive(:sleep).with(1).once
    #   i = 0
    #   subject.until(1, 1) do 
    #     i+=1
    #     i >4
    #   end
    # end

    # it "should exit after the default time if not specified" do
    #   expect(subject).to receive(:sleep).with(1).exactly(5).times
    #   i = 0
    #   subject.until(1) do 
    #     i+=1
    #     i >10
    #   end
    # end

    # it "should raise an error if it runs for longer than 5 seconds" do
    #   expect { subject.until(6, 5){ false } }.to raise_error("boom")
    # end

  end
end

