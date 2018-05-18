module UnderArmour
  module UnderArmourAPIWrapper
    def initialize(args = {})
      after_init(args)
    end

    def get
      HTTParty.get(url, headers: headers)
    end

    def post
      HTTParty.post(url, payload)
    end

    def url
      "#{base_url}#{endpoint}"
    end

    private

    def client_id
      ENV['UA_CLIENT_ID']
    end

    def client_secret
      ENV['UA_CLIENT_SECRET']
    end

    def base_url
      'https://api.ua.com/'
    end

    def endpoint
      raise 'endpoint required by subclasses'
    end

    def payload
      {
        body: data,
        headers: headers
      }
    end

    def data
      {}
    end

    def headers
      {}
    end

    def after_init(args)
      # hook for subclasses
    end
  end
end
