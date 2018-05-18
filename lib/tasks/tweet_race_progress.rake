desc 'This task checks for a new workout post and tweets it if found'

task tweet_workout: :environment do
  puts 'fetching your workout data...'
  date = Date.today
  RaceStatus::TweetRace.new(user: User.first, date: date, race: Race.last).tweet_progress
  puts 'tweeted your workout!'
end
