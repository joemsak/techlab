require "rails_helper"

RSpec.describe "Get channels" do
  it "groups channels chronologically by year" do
    old_2010 = Channel.create!(
      created_at: Date.new(2010, 1, 1),
      updated_at: Date.new(2010, 1, 2)
    )

    new_2010 = Channel.create!(
      created_at: Date.new(2010, 1, 1),
      updated_at: Date.new(2010, 1, 3)
    )

    old_2011 = Channel.create!(
      created_at: Date.new(2011, 1, 1),
      updated_at: Date.new(2011, 1, 2)
    )

    new_2011 = Channel.create!(
      created_at: Date.new(2011, 1, 1),
      updated_at: Date.new(2011, 1, 3)
    )

    channels = Channels::Read.chronological

    expect(channels.years.first).to eq(2011)
    expect(channels.years.last).to eq(2010)

    expect(channels.in(2010)).to eq([new_2010, old_2010])
    expect(channels.in(2011)).to eq([new_2011, old_2011])
  end
end
