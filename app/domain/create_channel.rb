class CreateChannel
  attr_reader :channel_class

  CHANNEL_ATTRS = %i{api_id key name description asset_url created_at updated_at}

  def initialize(channel_class = Channel)
    @channel_class = channel_class
  end

  def call(channel_json)
    channel_attrs = sanitize_channel_json(channel_json)
    channel_class.create!(channel_attrs)
  end

  private
  def sanitize_channel_json(json)
    attrs = json

    attrs[:api_id] = attrs[:id]

    attrs.select do |key, _|
      CHANNEL_ATTRS.include?(key)
    end
  end
end
