class Channel < ActiveRecord::Base
  scope :recently_updated_on_top, -> { order('updated_at DESC') }

  scope :grouped_by_created_year, ->(collection) {
    collection.group_by do |channel|
      channel.created_at.year
    end
  }


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
