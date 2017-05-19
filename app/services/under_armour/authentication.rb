module UnderArmour
  class Authentication
    include UnderArmourAPIWrapper

    def endpoint
      "oauth2/uacf/authorize/?#{parameters}"
    end

    def parameters
      "client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    end

    def redirect_uri
      "http://#{ENV['APPLICATION_ROOT_URL']}/callback"
    end

    def base_url
      'https://www.mapmyfitness.com/v7.1/'
    end
  end
end
