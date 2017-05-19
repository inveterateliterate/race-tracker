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

    private

    def url
      "#{base_url}#{endpoint}"
    end

    def client_id
      ENV['UA_API_KEY']
    end

    def client_secret
      ENV['UA_API_SECRET']
    end

    def base_url
      "https://www.api.ua.com/v7.1/"
    end

    def endpoint
      raise 'endpoint required by subclasses'
    end

    def payload
      {}
    end

    def data
      {}
    end

    def after_init(args)
      # hook for subclasses
    end
  end
end
