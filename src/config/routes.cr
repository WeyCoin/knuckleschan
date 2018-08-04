module KnucklesChan::Config
  module Routes
    get "/" do |env|
      Unity::Controller::PageController.new(env).home
    end
  end
end