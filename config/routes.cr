module KnucklesChan::Routes
  # host/
  get "/" do |env|
    env.response.content_type = "text/html" # move this is a helper method
    KnucklesChan::Controller::PageController.new(env).home
  end

  get "/register" do |env|
    env.response.content_type = "text/html"
    KnucklesChan::Controller::UserController.new(env).register
  end

  get "/login" do |env|
    env.response.content_type = "text/html"
    KnucklesChan::Controller::UserController.new(env).login
  end

  # host/v1/
  module Api::V1
    post "/api/auth/register" do |env|
      KnucklesChan::Controller::Api::AuthController.new(env).register
    end
  end

  Kemal.config.env = ENV["KEMAL_ENV"]
  Kemal.config.port = ENV["PORT"].to_i
  Kemal.run
end