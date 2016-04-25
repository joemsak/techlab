require "rails_helper"

RSpec.describe "Get a stream url" do
  it "returns nil if the response is empty" do
    expect(AudioAddict::Api::V1::Di).to receive(:get)
      .with('/listen/webplayer/trance.json')
      .and_return([])

    api = AudioAddict::Api::V1::Di.new
    url = api.stream_url(double(:channel, key: 'trance'))

    expect(url).to be_nil
  end

  it "returns the last url if the 3rd one is not pub5" do
    expect(AudioAddict::Api::V1::Di).to receive(:get)
      .with('/listen/webplayer/trance.json')
      .and_return([
        "http://pub2.di.fm:80/di_trance_aac.flv",
        "http://pub1.di.fm:80/di_trance_aac.flv",
        "http://pub4.di.fm:80/di_trance_aac.flv",
        "http://pub6.di.fm:80/di_trance_aac.flv",
        "http://pub5.di.fm:80/di_trance_aac.flv",
        "http://pub8.di.fm:80/di_trance_aac.flv",
        "http://pub7.di.fm:80/di_trance_aac.flv"
      ])

    api = AudioAddict::Api::V1::Di.new
    url = api.stream_url(double(:channel, key: 'trance'))

    expect(url).to eq("http://pub7.di.fm:80/di_trance_aac.flv")
  end

  it "returns pub5 if it's the 3rd one" do
    expect(AudioAddict::Api::V1::Di).to receive(:get)
      .with('/listen/webplayer/trance.json')
      .and_return([
        "http://pub2.di.fm:80/di_trance_aac.flv",
        "http://pub1.di.fm:80/di_trance_aac.flv",
        "http://pub5.di.fm:80/di_trance_aac.flv",
        "http://pub4.di.fm:80/di_trance_aac.flv",
        "http://pub6.di.fm:80/di_trance_aac.flv",
        "http://pub8.di.fm:80/di_trance_aac.flv",
        "http://pub7.di.fm:80/di_trance_aac.flv"
      ])

    api = AudioAddict::Api::V1::Di.new
    url = api.stream_url(double(:channel, key: 'trance'))

    expect(url).to eq("http://pub5.di.fm:80/di_trance_aac.flv")
  end
end
