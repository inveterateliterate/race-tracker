module UnderArmour
  class Authorization
    include UnderArmourAPIWrapper

    attr_reader :code

    def authorize
      post
    end

    private

    def endpoint
      'oauth2/uacf/access_token/'
    end

    def payload
      {
        body: data,
        headers: headers
      }
    end

    def headers
      {
        'content-type' => 'application/x-www-form-urlencoded',
        'api-key' => client_id,
        'accept' => 'application/json'
      }
    end

    def data
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'authorization_code',
        code: code
      }
    end

    def after_init(args)
      @code = args[:code]
      raise 'code required' if @code.nil?
    end
  end
end
