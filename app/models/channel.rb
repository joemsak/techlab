class Channel < ActiveRecord::Base
  scope :recently_updated_on_top, -> { order('updated_at DESC') }

  def self.grouped_by_created_year(channels)
    channels.group_by { |channel| channel.created_at.year }
  end

  def self.storage_attrs
    %i{api_id
       key
       name
       description
       asset_url
       created_at
       updated_at}
  end
end
