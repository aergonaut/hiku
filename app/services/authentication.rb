require 'octokit'

class Authentication
  def initialize(params)
    @params = params
  end
  
  def user
    @user ||= user_from_omniauth
  end
  
  def authenticated?
    user.present?
  end
  
  private
  
  def user_from_omniauth
    if user_from_correct_org?
      User.find_or_create_by!(@params.slice(:provider, :uid)) do |user|
        user.login = @params[:info][:nickname]
        user.email = @params[:info][:email]
        user.name = @params[:info][:name]
        user.access_token = @params[:credentials][:token]
      end
    end
  end
  
  def user_from_correct_org?
    token = @params[:credentials][:token]
    client = Octokit::Client.new(access_token: token)
    orgs = client.organizations
    orgs.map { |o| o[:login] }.include?(ENV["HIKU_GITHUB_ORGANIZATION"])
  end
end
