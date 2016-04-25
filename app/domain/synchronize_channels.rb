class SynchronizeChannels
  attr_reader :api, :channel_creator

  def initialize(api_class = AudioAddictApi, channel_creator = CreateChannel)
    @api = api_class.new
    @channel_creator = channel_creator.new
  end

  def call
    json = api.channels

    json.map do |channel|
      channel_creator.call(channel)
    end
  end
end
