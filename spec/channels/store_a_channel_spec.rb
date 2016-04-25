require "rails_helper"

RSpec.describe "Store a channel" do
  it "creates a channel in the DB from the api" do
    VCR.use_cassette('create a channel') do
      create_channel = Channels::Create.new
      json = JSON.parse(File.read("./spec/fixtures/raw_channel.json"))

      channel = create_channel.call(json)

      expect(channel).to be_persisted
      expect(channel.api_id).to eq(1)
      expect(channel.key).to eq('trance')
      expect(channel.name).to eq('Trance')
      expect(channel.description).to include('embraces melodies')
      expect(channel.asset_url).to eq(
        "//static.audioaddict.com/d/4/a/1/d/6/d4a1d6bc58dea523ff90efdccc9dd7b5.png"
      )
      expect(channel.created_at).to eq(DateTime.parse("2010-03-16T18:02:42-04:00"))
      expect(channel.updated_at).to eq(DateTime.parse("2015-02-17T14:56:41-05:00"))
    end
  end

  it "adds the stream url from the webplayer api" do
    VCR.use_cassette('create a channel') do
      create_channel = Channels::Create.new
      json = JSON.parse(File.read("./spec/fixtures/raw_channel.json"))

      channel = create_channel.call(json)

      expect(channel.stream_url).to eq("http://pub7.di.fm:80/di_trance_aac.flv")
    end
  end
end
