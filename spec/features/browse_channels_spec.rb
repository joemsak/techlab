require "rails_helper"

RSpec.feature "Browse channels" do
  scenario "See channels on the chronological page" do
    Channel.create!(name: "Old 2010",
                    created_at: Date.new(2010, 1, 1),
                    updated_at: Date.new(2010, 1, 2))

    Channel.create!(name: "New 2010",
                    created_at: Date.new(2010, 1, 1),
                    updated_at: Date.new(2010, 1, 3))

    Channel.create!(name: "Old 2011",
                    created_at: Date.new(2011, 1, 1),
                    updated_at: Date.new(2011, 1, 2))

    Channel.create!(name: "New 2011",
                    created_at: Date.new(2011, 1, 1),
                    updated_at: Date.new(2011, 1, 3))

    visit chronological_channels_path

    tabs = page.all('.nav-tabs .nav-link')

    expect(tabs.first.text).to eq('2011')
    expect(tabs.last.text).to eq('2010')


    rows_2010 = page.all('#channels-2010 .channel-name')
    rows_2011 = page.all('#channels-2011 .channel-name')

    expect(rows_2010.first.text).to eq('New 2010')
    expect(rows_2010.last.text).to eq('Old 2010')

    expect(rows_2011.first.text).to eq('New 2011')
    expect(rows_2011.last.text).to eq('Old 2011')
  end
end
