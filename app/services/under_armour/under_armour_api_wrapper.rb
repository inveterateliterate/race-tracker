module UnderArmour
  module UnderArmourAPIWrapper
    def initialize(args = {})
      after_init(args)
    end

    def get
      HTTParty.get(url, payload)
    end

    def post
      HTTParty.post(url, payload)
    end

    def url
      "#{base_url}#{endpoint}"
    end

    private

    def client_id
      ENV['UA_API_KEY']
    end

    def client_secret
      ENV['UA_API_SECRET']
    end

    def base_url
      'https://api.ua.com/v7.1/'
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
