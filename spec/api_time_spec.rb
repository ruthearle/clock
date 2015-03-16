require 'api_time'

describe ApiTime do
  describe "#get" do
    it "returns the current time" do
      expect(ApiTime.get).to eq ({ :time => '\d{4}\W\d{2}\W\d{2}\s\d{2}\W\d{2}\W\d{2}\s\W\d{4}' })
    end
  end
end
