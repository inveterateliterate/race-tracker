module RaceStatus
  class TweetRace
    attr_reader :user, :new_workout, :workouts, :distance, :speed, :pace, :msg

    METERS_PER_MILE = 1609.34

    def initialize
      @user = User.first
    end

    def tweet_progress
      fetch_workouts
      confirm_new_workout
      return unless new_workout
      workout_metrics
      tweet_metrics
    end

    private

    def fetch_workouts
      @workouts = UnderArmour::ActivityData.new(user: user).fetch_workouts
    end

    def confirm_new_workout
      @new_workout = workouts.count > Workout.all.count ? workouts.last : nil
    end

    def workout_metrics
      @distance = (new_workout['aggregates']['distance_total'] / METERS_PER_MILE).round(2)
      @speed = (new_workout['aggregates']['active_time_total'] / 60).round(2)
      @pace = (speed / distance).round(2)
      create_workout
    end

    def create_workout
      Workout.create(distance: distance, speed: speed, pace: pace, race_id: Race.first.id)
    end

    def tweet_metrics
      quote = msg_quotes.sample
      @msg = "#{quote} I've run another #{distance} miles in #{speed} minutes, at #{pace} minutes per mile"
      Twitter::TwitterAPI.new.tweet(msg)
      create_tweet
      Workout.last.update(tweet_id: Tweet.last.id)
    end

    def msg_quotes
      ['Going Strong!', 'Feeling Good!', 'Ready to Go!']
    end

    def create_tweet
      tweet = Tweet.new(date: Date.today, content: msg, user: user, race: Race.first)
      tweet.save
    end
  end
end
