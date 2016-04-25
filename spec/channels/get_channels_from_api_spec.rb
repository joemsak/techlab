require "rails_helper"

RSpec.describe "Get channels from API" do
  it "returns empty array for no results" do
    response = AudioAddictApi.channels
    expect(response).to be_empty
  end
end
