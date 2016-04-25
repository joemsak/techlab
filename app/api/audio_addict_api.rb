require 'httparty'

class AudioAddictApi
  include HTTParty

  base_uri 'api.audioaddict.com/v1/di'

  PREFERRED_STREAM_URL_HOST = 'pub5'
  PREFERRED_STREAM_URL_POSITION = 2

  def channels
    Rails.cache.fetch(:di_channels) do
      self.class.get("/channels.json")
    end
  end

  def stream_url(channel)
    streams = Rails.cache.fetch("streams_for_#{channel.key}") do
      self.class.get("/listen/webplayer/#{channel.key}.json").to_a
    end

    preferred_stream_url(streams) || streams.last
  end

  private
  def preferred_stream_url(streams)
    url = streams[PREFERRED_STREAM_URL_POSITION]
    url && url.match(/#{PREFERRED_STREAM_URL_HOST}/) ? url : nil
  end
end
