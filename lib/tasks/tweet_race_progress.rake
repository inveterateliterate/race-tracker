desc 'This task checks for a new workout post and tweets it if found'

task tweet_workout: :environment do
  puts 'fetching your workout data...'
  RaceStatus::TweetRace.new(user: User.first).tweet_progress
  puts 'tweeted your workout!'
end
