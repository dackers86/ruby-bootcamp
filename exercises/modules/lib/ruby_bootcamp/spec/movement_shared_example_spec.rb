
shared_examples "a moving entity" do
  
  describe '#Person' do
      it "can speak" do
        expect(subject).to receive(:say).and_return("speak")
        subject.say("speak")
      end

      it "can shout" do
        expect(subject).to receive(:shout).and_return("SHOUT")
        subject.shout("shout")
      end

      it "can greet" do
        expect(subject).to receive(:greeting).and_return(!nil)
        subject.greeting
      end

      it "can farewell" do
        expect(subject).to receive(:farewell).and_return(!nil)
        subject.farewell
      end
    end
end