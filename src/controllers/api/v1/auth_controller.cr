module KnucklesChan::Controller
  class Api::AuthController
    def initialize(@env : HTTP::Server::Context) end

    def register
      {left: "up"}.to_json
    end

    def login
      {left: "up"}.to_json
    end
  end
end