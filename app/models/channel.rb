class Channel < ActiveRecord::Base
  scope :recently_updated_on_top, -> { order('updated_at DESC') }

  def self.grouped_by_created_year(channels = all)
    channels.group_by { |channel| channel.created_at.year }
  end

  def self.storage_attrs
    %i{api_id
       asset_url
       created_at
       description
       key
       name
       updated_at}
  end
end
