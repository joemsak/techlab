class ChannelsController < ApplicationController
  def chronological
    @channels = GetChannels.chronological
  end
end
