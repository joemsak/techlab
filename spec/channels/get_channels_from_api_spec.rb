require "rails_helper"

RSpec.describe "Get channels from API" do
  it 'has the audio addict api as its base' do
    expect(AudioAddictApi.base_uri).to eq('http://api.audioaddict.com/v1/di')
  end
  end
end
