class CreateChannel
  attr_reader :api_class, :channel_class

  def initialize(api_class = AudioAddictApi, channel_class = Channel)
    @api_class = api_class
    @channel_class = channel_class
  end

  def call(channel_json)
    channel_attrs = sanitize_channel_json(channel_json)

    channel = channel_class.new(channel_attrs)
    channel.stream_url = stream_url_for(channel)
    channel.save

    channel
  end

  private
  def stream_url_for(channel)
    api = api_class.new
    api.stream_url(channel)
  end

  def sanitize_channel_json(json)
    attrs = json.with_indifferent_access

    attrs[:api_id] = attrs[:id]

    attrs.select do |key, _|
      channel_class.storage_attrs.include?(key.to_sym)
    end
  end
end
