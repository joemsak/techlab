require "rails_helper"

RSpec.describe "Get channels from API" do
  it 'has the audio addict api as its base' do
    expect(AudioAddict::Api::V1::Di.base_uri).to eq('http://api.audioaddict.com/v1/di')
  end

  it "returns an item from the json response" do
    VCR.use_cassette('channels json') do
      api = AudioAddict::Api::V1::Di.new
      channels = api.channels

      first_channel = channels.first

      expect(first_channel['channel_director']).to eq('Entranced')
    end
  end
end
