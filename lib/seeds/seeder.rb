module Seeds
  class Seeder
    class << self
      def seed
        puts 'cleaning db...'
        clean_db
        puts 'creating users...'
        create_users
        puts 'creating races...'
        create_races
        puts 'create hashtags'
        create_hashtags
        puts 'seeding complete'
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(Tweet Hashtag Workout Race User)
      end

      def create_users
        User.create!(first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'], email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'])
      end

      def create_races
        user = User.first
        races = [
          {
            date: Date.new(2017, 5, 22),
            name: 'Chicago 2017 Spring Half Marathon',
            distance: '13.1 miles',
            user: user
          },
          {
            date: Date.new(2018, 5, 21),
            name: 'Chicago 2018 Spring Half Marathon',
            distance: '13.1 miles',
            user: user
          }
        ]
        Race.create!(races)
      end

      def create_hashtags
        hashtags = []
        Race.all.each do |race|
          hashtags << [
            {
              text: 'ChiSpringHalf',
              race_id: race.id
            },
            {
              text: "#{race.date.year}ChiHalf",
              race_id: race.id
            }
          ]
        end
        Hashtag.create!(hashtags)
      end
    end
  end
end
