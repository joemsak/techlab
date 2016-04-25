class ChannelsController < ApplicationController
  def chronological
    @channels = Channels::Read.chronological
  end
end
