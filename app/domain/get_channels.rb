class GetChannels
  def self.chronological(channel_class = Channel)
    channels_latest_updated_on_top = channel_class.order('updated_at DESC')

    grouped_by_year = channels_latest_updated_on_top.group_by do |channel|
      channel.created_at.year
    end

    years_sorted_newest_on_top = grouped_by_year.sort_by { |year, _| year }.reverse
  end
end
