module KnucklesChan::Controller
  class PageController
    def initialize(@env : HTTP::Server::Context) end

      def home
        view("pages/home")
      end
  end
end