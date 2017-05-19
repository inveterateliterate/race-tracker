module UnderArmour
  class ActivityData
    include UnderArmourAPIWrapper

    attr_reader :token, :user_id, :distance, :run_time, :pace

    METERS_PER_MILE = 1609.34

    def workout_metrics
      workouts = fetch_workouts
      return nil if workouts.empty?
      last_workout = workouts.last['aggregates']
      @distance = (last_workout['distance_total'] / METERS_PER_MILE).round(2)
      @run_time = (last_workout['active_time_total'] / 60).round(2)
      @pace = (run_time / distance).round(2)
      self
    end

    private

    def fetch_workouts
      response = HTTParty.get(url, payload)
      response = JSON.parse(response.body)
      # workouts
      response['_embedded']['workouts']
    end

    def endpoint
      # start_date = (DateTime.new(2017, 5, 20, 0, 0, 0)).iso8601
      start_date = (DateTime.new(2017, 4, 3, 0, 0, 0)).iso8601
      "workout/?user=#{user_id}&started_after=#{start_date}&order_by=start_datetime"
    end

    def headers
      {
        'content-type' => 'application/x-www-form-urlencoded',
        'api-key' => client_id,
        'authorization' => "Bearer #{token}",
        'accept' => 'application/json'
      }
    end

    def after_init(args)
      user = args[:user]
      @token = user.access_token
      @user_id = user.ua_user_id
    end
  end
end
