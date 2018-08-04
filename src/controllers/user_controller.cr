module KnucklesChan::Controller
  class UserController
    def initialize(@env : HTTP::Server::Context) end

    def register
      view("users/register")
    end

    def login
      view("users/login")
    end
  end
end