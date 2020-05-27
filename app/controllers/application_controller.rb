class ApplicationController < ActionController::API

    def secret_key
        ENV['secret_key']
    end

    #given a payload {user_id: ?} => token
    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    #given a token => payload
    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: "HS256"})[0]
    end

end
