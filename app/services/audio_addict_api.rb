require 'httparty'

class AudioAddictApi
  include HTTParty

  base_uri 'api.audioaddict.com/v1/di'

  def channels
    self.class.get("/channels.json")
  end

  def stream_url(channel)
    resp = self.class.get("/listen/webplayer/#{channel.key}.json")
    resp[2]
  end
end
