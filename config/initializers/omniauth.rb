Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["HIKU_GITHUB_CLIENT_ID"], ENV["HIKU_GITHUB_CLIENT_SECRET"], scope: "user:email,repo,read:org"
end
