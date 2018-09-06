# for development we can .env
# in production we use ram
if File.exists?(".env")
  Dotenv.load
end