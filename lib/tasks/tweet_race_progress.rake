desc 'This task checks for a new workout post and tweets it if found'

task tweet_workout: :environment do
  puts 'fetching your workout data...'
  user = User.find_by(email: ENV['ADMIN_EMAIL'])
  date = Date.today
  RaceStatus::TweetRace.new(user: user, date: date, race: user.races.last).tweet_progress
  puts 'tweeted your workout!'
end
