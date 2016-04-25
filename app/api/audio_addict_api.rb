require 'httparty'

class AudioAddictApi
  include HTTParty

  base_uri 'api.audioaddict.com/v1/di'

  def channels
    Rails.cache.fetch(:di_channels) do
      self.class.get("/channels.json")
    end
  end

  def stream_url(channel)
    streams = Rails.cache.fetch("streams_for_#{channel.key}") do
      self.class.get("/listen/webplayer/#{channel.key}.json").to_a
    end

    url = pub5_as_third_url(streams)
    url ||= streams.last
  end

  private
  def pub5_as_third_url(streams)
    url = streams[2]
    url if url && url.match(/pub5/)
  end
end
