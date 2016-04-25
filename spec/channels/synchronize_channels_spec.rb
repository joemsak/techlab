require "rails_helper"

RSpec.describe "Synchronize channels" do
  it "creates the channels from the audio addict api" do
    VCR.use_cassette('channels json', record: :new_episodes) do
      sync = SynchronizeChannels.new

      channels = sync.call

      indie = channels.last
      chiptunes = channels.select { |c| c.name == "XChiptunes" }.first

      expect(indie.name).to eq("Indie Beats")
      expect(chiptunes.description).to include("chiptunes and video")
    end
  end
end
