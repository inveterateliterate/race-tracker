module RaceStatus
  class TweetRace
    attr_reader :user, :new_workout, :ua_workouts, :distance, :speed, :pace, :msg, :all_workouts, :race

    METERS_PER_MILE = 1609.34

    def initialize(args = {})
      @user = args[:user] || User.first
      @race = args[:race]
    end

    def tweet_progress
      fetch_workouts
      confirm_new_workout
      return unless new_workout
      creat_workout
      tweet_metrics
    end

    private

    def fetch_workouts
      @ua_workouts = UnderArmour::ActivityData.new(user: user).fetch_workouts
    end

    def confirm_new_workout
      @new_workout = ua_workouts.count > Workout.all.count ? ua_workouts.last : nil
    end

    def workout_metrics
      @distance = (new_workout['aggregates']['distance_total'] / METERS_PER_MILE).round(2)
      @speed = (new_workout['aggregates']['active_time_total'] / 60).round(2)
      @pace = (speed / distance).round(2)
    end

    def create_workout
      workout_metrics
      Workout.create(distance: distance, speed: speed, pace: pace, race_id: Race.first.id)
      @all_workouts = Workout.all
    end

    def tweet_metrics
      num = all_workouts.count
      quote = msg_quotes[num.to_s]

      @msg = "#{quote} at a pace of #{pace} minutes per mile #ChiSpringHalf #RunCHI"
      Twitter::TwitterAPI.new.tweet(msg)
      create_tweet
      Workout.last.update(tweet_id: Tweet.last.id)
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

    def create_tweet
      tweet = Tweet.new(date: Date.today, content: msg, user: user, race: Race.first)
      tweet.save
    end
  end
end
