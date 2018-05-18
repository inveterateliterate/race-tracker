module RaceStatus
  class TweetRace
    include WorkoutMetrics
    include Messages
    attr_reader :user, :date, :race, :ua_workouts, :metrics, :todays_workouts, :msg

    def initialize(args = {})
      raise 'missing required args' if missing_required_args?(args)
      @user = args[:user]
      @date = args[:date]
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
      @msg = craft_message
      Twitter::TwitterAPI.new.tweet(msg)
      tweet = save_tweet
      todays_workouts.last.update(tweet_id: tweet.id)
    end

    def save_tweet
      Tweet.create(date: Date.today, content: msg, user: user, race: race)
    end

    def required_args
      [:user, :date, :race]
    end

    def missing_required_args?(args)
      required_args.any? { |r| args[r].nil? }
    end
  end
end
