class Channel < ActiveRecord::Base
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
