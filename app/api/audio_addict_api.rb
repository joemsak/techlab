require 'httparty'

class AudioAddictApi
  include HTTParty

  base_uri 'api.audioaddict.com/v1/di'

  def channels
    self.class.get("/channels.json")
  end

  def stream_url(channel)
    resp = self.class.get("/listen/webplayer/#{channel.key}.json")
    arrayed = resp.to_a
    url = pub5_as_third_url(arrayed)
    url ||= arrayed.last
  end

  private
  def pub5_as_third_url(resp)
    url = resp[2]
    url if url && url.match(/pub5/)
  end
end
