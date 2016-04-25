class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.integer :api_id
      t.string :key
      t.string :name
      t.string :description
      t.string :asset_url
      t.string :stream_url

      t.timestamps null: false
    end
  end
end
