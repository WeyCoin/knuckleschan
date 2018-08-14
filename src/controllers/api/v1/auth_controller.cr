module KnucklesChan::Controller
  class Api::AuthController
    def initialize(@env : HTTP::Server::Context) end

    def register
      username = @env.params.json["username"].as(String)
      hex = @env.params.json["hex"].as(String)

      puts username
      puts hex
      
      {left: "up"}.to_json
    end

    def login
      {left: "up"}.to_json
    end
  end
end