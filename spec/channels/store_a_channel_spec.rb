require "rails_helper"

RSpec.describe "Store a channel" do
  it "creates a channel in the DB from the api" do
    create_channel = CreateChannel.new

    channel = create_channel.call(raw_channel_json)

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

  def raw_channel_json
    {
      "ad_channels": "8554477917, electronic_music, 8614582190",
      "channel_director": "Entranced",
      "created_at": "2010-03-16T18:02:42-04:00",
      "description_long": "",
      "description_short": "Emotive high energy dance music which embraces melodies, vocals and a true journey of dance music songwriting.",
      "forum_id": 5,
      "id": 1,
      "key": "trance",
      "name": "Trance",
      "network_id": 1,
      "old_id": 1,
      "premium_id": 0,
      "tracklist_server_id": 25623,
      "updated_at": "2015-02-17T14:56:41-05:00",
      "asset_id": 122569,
      "asset_url": "//static.audioaddict.com/d/4/a/1/d/6/d4a1d6bc58dea523ff90efdccc9dd7b5.png",
      "banner_url": "//static.audioaddict.com/0/4/e/f/a/b/04efabb01b49c65bc61703ac3f97572b.png",
      "description": "Emotive high energy dance music which embraces melodies, vocals and a true journey of dance music songwriting.",
      "similar_channels": [],
      "images": {}
    }
  end
end
