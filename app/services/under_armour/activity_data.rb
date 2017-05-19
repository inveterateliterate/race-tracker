module UnderArmour
  class ActivityData
    include UnderArmourAPIWrapper

    attr_reader :token, :user_id

    def fetch_workouts
      response = HTTParty.get(url, payload)
      response = JSON.parse(response.body)
      # workouts
      response['_embedded']['workouts']
    end

    private

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
