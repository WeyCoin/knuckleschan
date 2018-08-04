module KnucklesChan::Config
  module Routes
    get "/" do |env|
      KnucklesChan::Controller::PageController.new(env).home
    end

    get "/register" do |env|
      KnucklesChan::Controller::UserController.new(env).register
    end

    get "/login" do |env|
      KnucklesChan::Controller::UserController.new(env).login
    end
  end
end