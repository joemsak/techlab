class SynchronizeChannels
  attr_reader :api, :channel_creator

  def initialize(api_class = AudioAddict::Api::V1::Di, channel_creator = CreateChannel)
    @api = api_class.new
    @channel_creator = channel_creator.new
  end

  def call
    api.channels.map do |channel|
      channel = channel_creator.call(channel)
      yield(channel) if block_given?
      channel
    end
  end
end
