Kave.configure do |c|
  c.format = :json
  c.auth_strategy = :bearer
  c.token_model = KnucklesChan::Helper::KaveToken
  # c.version_strategy = :header
end