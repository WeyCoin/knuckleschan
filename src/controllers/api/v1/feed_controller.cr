module KnucklesChan::Controller
  class Api::FeedController
    def initialize(@env : HTTP::Server::Context) end

    def main
      Helper::Res.json()
    end

  end
end