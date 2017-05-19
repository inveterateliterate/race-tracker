module RaceStatus
  class TweetRace
    attr_reader :user, :workout_metrics, :msg

    def initialize
      @user = User.first
    end

    def tweet_progress
      fetch_workout_metrics
      return unless @workout_metrics.present?
      tweet_metrics
      create_tweet
    end

    private

    def fetch_workout_metrics
      @workout_metrics = UnderArmour::ActivityData.new(user: user).workout_metrics
    end

    def tweet_metrics
      quote = msg_quotes.sample
      dist = workout_metrics.distance
      time = workout_metrics.run_time
      pace = workout_metrics.pace
      @msg = "#{quote} I've run another #{dist} miles in #{time} minutes, at #{pace} minutes per mile"
      Twitter::TwitterAPI.new.tweet(msg)
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
