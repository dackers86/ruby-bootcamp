require "spec_helper"

describe Statement do |variable|

  subject(:statement) {  described_class.new }

  describe '#Call' do
    it "returns a statement" do

      expect(subject).to receive(:generate)
      subject.generate()
    end

  describe '#JSON Result' do
    it "returns valid JSON" do


      var expected_result = {
          "statement": {
            "generated": "2015-01-11",
            "due": "2015-01-25",
            "period": {
              "from": "2015-01-26",
              "to": "2015-02-25"
            },
            "total": 1.23,
            "callCharges": {
              "calls": [
                { "called": "07716393769", "date": "2015-01-26", "duration": "00:23:03", "cost": 1.13 },
                { "called": "07716393769", "date": "2015-01-26", "duration": "00:23:03", "cost": 0.20 }

              ]
            }
          }
        }

      expect(subject).to receive(:generate).and_return(expected_result)
      subject.to_json()
    end
  end
end

