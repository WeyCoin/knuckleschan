module KnucklesChan::Routes
  public do
    # host/
    post "/auth/register" do |env|
      KnucklesChan::Controller::Api::AuthController.new(env).register
    end

    post "/auth/login" do |env|
      KnucklesChan::Controller::Api::AuthController.new(env).login
    end
  end

  api("v1") do
    # host/v1/
    post "/feed" do |env|
      KnucklesChan::Controller::Api::FeedController.new(env).main
    end
  end

  Kemal.config.env = ENV["KEMAL_ENV"]
  Kemal.config.port = ENV["PORT"].to_i
  Kemal.run
end