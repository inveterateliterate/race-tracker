module RaceStatus
  class TweetRace
    attr_reader :user, :race, :ua_workouts, :metrics, :all_workouts, :msg

    METERS_PER_MILE = 1609.34

    def initialize(args = {})
      @user = args[:user]
      raise 'user is required' unless user
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
      @ua_workouts = UnderArmour::ActivityData.new(user: user).fetch_workouts
    end

    def new_workout?
      ua_workouts.count > Workout.all.count
    end

    def create_workout
      workout_metrics
      Workout.create(distance: metrics[:distance], speed: metrics[:speed], pace: metrics[:pace], race_id: race.try(:id), user_id: user.id)
      @all_workouts = Workout.all
    end

    def workout_metrics
      new_workout = ua_workouts.last
      @metrics = {
        distance: (new_workout['aggregates']['distance_total'] / METERS_PER_MILE).round(2),
        speed: (new_workout['aggregates']['active_time_total'] / 60).round(2)
      }
      @metrics[:pace] = (metrics[:speed] / metrics[:distance]).round(2)
      @metrics
    end

    def tweet_metrics
      num = all_workouts.count
      quote = msg_quotes[num.to_s]

      @msg = "#{quote} at a pace of #{metrics[:pace]} minutes per mile #ChiSpringHalf #RunCHI"
      Twitter::TwitterAPI.new.tweet(msg)
      tweet = save_tweet
      all_workouts.last.update(tweet_id: tweet.id)
    end

    def msg_quotes
      {
        '1' => "Feeling good! #{sum_distances} miles and #{sum_times} minutes down,",
        '2' => "Almost halfway through! #{sum_distances} miles covered in #{sum_times} minutes,",
        '3' => "Going strong! I've run #{sum_distances} miles in #{sum_times} minutes,",
        '4' => "Final stretch! #{sum_distances} miles completed in #{sum_times} minutes,"
      }
    end

    def sum_distances
      all_distances = all_workouts.pluck(:distance)
      (all_distances.reduce(:+)).round(2)
    end

    def sum_times
      all_times = all_workouts.pluck(:speed)
      (all_times.reduce(:+) + all_times.length * 0.15).round(2)
    end

    def save_tweet
      Tweet.create(date: Date.today, content: msg, user: user, race: race)
    end
  end
end
