module RaceStatus
  module Messages
    def craft_message
      quote = msg_quotes[todays_workouts.count - 1]
      tags = formatted_tags(race)
      "#{quote} at a pace of #{metrics[:pace]} minutes per mile #{tags}"
    end

    def msg_quotes
      race.marathon? ? marathon_messages : half_marathon_messages
    end

    def formatted_tags(race)
      race.hash_tags.map { |tag| '#' + tag.tag }.join(' ')
    end

    def half_marathon_messages
      [feeling_good, halfway, going_strong, final_stretch]
    end

    def marathon_messages
      # four more for marathon
      [feeling_good, halfway, going_strong, final_stretch]
    end

    def feeling_good
      "Feeling good! #{sum_distances} miles and #{sum_times} minutes down,"
    end

    def halfway
      "Almost halfway through! #{sum_distances} miles covered in #{sum_times} minutes,"
    end

    def going_strong
      "Going strong! I've run #{sum_distances} miles in #{sum_times} minutes,"
    end

    def final_stretch
      "Final stretch! #{sum_distances} miles completed in #{sum_times} minutes,"
    end
  end
end
