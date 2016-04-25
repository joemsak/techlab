require "rails_helper"

RSpec.describe "Get a stream url" do
  it "returns nil if the response is empty" do
    expect(AudioAddictApi).to receive(:get)
      .with('/listen/webplayer/trance.json')
      .and_return([])

    api = AudioAddictApi.new
    url = api.stream_url(double(:channel, key: 'trance'))

    expect(url).to be_nil
  end

  it "returns the last url if the 3rd one is not pub5"
  it "returns pub5 if it's the 3rd one"
end
