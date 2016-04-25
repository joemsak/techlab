class GetChannels
  def self.chronological(channel_class = Channel)
    grouped_by_year = channel_class.grouped_by_created_year(
      channel_class.recently_updated_on_top
    )

    years_sorted_newest_on_top = grouped_by_year.sort.reverse.to_h
  end
end
