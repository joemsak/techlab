module Channels
  class Read
    def self.chronological(channel_class = Channel)
      sorted_channels = channel_class.recently_updated_on_top

      grouped_by_year = channel_class.grouped_by_created_year(
        sorted_channels
      )

      years_sorted_desc = grouped_by_year.sort.reverse.to_h

      GroupedByYearChannelsCollection.new(years_sorted_desc)
    end

    class GroupedByYearChannelsCollection
      attr_reader :grouped_hash

      def initialize(grouped_hash)
        @grouped_hash = grouped_hash
      end

      def years
        grouped_hash.keys
      end

      def in(year)
        grouped_hash[year]
      end
    end
  end
end
