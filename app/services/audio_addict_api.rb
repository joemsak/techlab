require 'httparty'

class AudioAddictApi
  include HTTParty

  base_uri 'api.audioaddict.com/v1/di'

  def channels
    self.class.get("/channels.json")
  end
end
