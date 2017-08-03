module Seeds
  class Seeder
    class << self
      def seed
        puts 'cleaning db...'
        clean_db
        puts 'creating users...'
        create_users
        # puts 'creating races...'
        # create_races
        puts 'seeding complete'
      end

      private

      def clean_db
        tables.each { |table| table.constantize.destroy_all }
      end

      def tables
        %w(Tweet HashTag Workout Race User)
      end

      def create_users
        User.create(first_name: ENV['ADMIN_FIRST_NAME'], last_name: ENV['ADMIN_LAST_NAME'], email: ENV['ADMIN_EMAIL'])
      end
    end
  end
end
