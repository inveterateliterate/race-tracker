module UnderArmour
  class Settings
    include UnderArmourAPIWrapper

    attr_reader :token, :callback_uri

    def fetch_settings
      response = get
      JSON.parse(response.body)
    end

    def set_settings
      HTTParty.patch(url, payload)
      fetch_settings
    end

    private

    def endpoint
      "v7.2/api_client/#{client_id}/"
    end

    def headers
      {
        'api-key' => client_id,
        'authorization' => "Bearer #{token}",
        'accept' => 'application/json'
      }
    end

    def data
      JSON.generate({
        callback_uri: callback_uri,
        application_title: 'RaceTweeter',
      })
    end

    def after_init(args)
      user = User.find_by(email: ENV['ADMIN_EMAIL'])
      @token = user.access_token
      @callback_uri = "#{args[:callback_uri]}/callback"
    end
  end
end
