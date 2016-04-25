class CreateChannel
  attr_reader :api, :channel, :channel_class

  def initialize(api_class = AudioAddict::Api::V1::Di, channel_class = Channel)
    @api = api_class.new
    @channel_class = channel_class
  end

  def call(json)
    @channel = channel_class.new

    set_response_attrs_on_channel(json)
    set_stream_url_on_channel

    channel.save
    channel
  end

  private
  def set_response_attrs_on_channel(json)
    sanitized_attributes(json).each do |attr, value|
      channel.send("#{attr}=", value)
    end
  end

  def set_stream_url_on_channel
    channel.stream_url = api.stream_url(channel)
  end

  def sanitized_attributes(json)
    attrs = json.with_indifferent_access

    attrs[:api_id] = attrs[:id]

    attrs.select do |key, _|
      channel_class.storage_attrs.include?(key.to_sym)
    end
  end
end
