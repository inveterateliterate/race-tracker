module RaceStatus
  class TweetRace
    include WorkoutMetrics
    attr_reader :user, :date, :race, :ua_workouts, :metrics, :todays_workouts, :msg

    def initialize(args = {})
      @user = args[:user]
      raise 'user is required' unless user
      @date = args[:date]
      raise 'date is required' unless date
      @race = args[:race]
    end

    def tweet_progress
      fetch_workouts
      return unless new_workout?
      create_workout
      tweet_metrics
    end

    private

    def fetch_workouts
      @ua_workouts = UnderArmour::ActivityData.new(user: user, date: date).fetch_workouts
    end

    def new_workout?
      ua_workouts.count > user.workouts.today.count
    end

    def create_workout
      @metrics = workout_metrics(ua_workouts.last)
      user.workouts.create(
        distance: metrics[:distance],
        speed: metrics[:speed],
        pace: metrics[:pace],
        race_id: race.try(:id),
      )
      @todays_workouts = user.workouts.today
    end

    def tweet_metrics
      num = todays_workouts.count
      quote = msg_quotes[num.to_s]

      @msg = "#{quote} at a pace of #{metrics[:pace]} minutes per mile #{formatted_tags}"
      Twitter::TwitterAPI.new.tweet(msg)
      tweet = save_tweet
      todays_workouts.last.update(tweet_id: tweet.id)
    end

    def formatted_tags
      race.hash_tags.map { |tag| '#' + tag.tag }.join(' ')
    end

    def msg_quotes
      {
        '1' => "Feeling good! #{sum_distances(todays_workouts)} miles and #{sum_times(todays_workouts)} minutes down,",
        '2' => "Almost halfway through! #{sum_distances(todays_workouts)} miles covered in #{sum_times(todays_workouts)} minutes,",
        '3' => "Going strong! I've run #{sum_distances(todays_workouts)} miles in #{sum_times(todays_workouts)} minutes,",
        '4' => "Final stretch! #{sum_distances(todays_workouts)} miles completed in #{sum_times(todays_workouts)} minutes,"
      }
    end

    def save_tweet
      Tweet.create(date: Date.today, content: msg, user: user, race: race)
    end
  end
end
