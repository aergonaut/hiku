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
    end
  end
  
  def user_from_correct_org?
    token = @params["credentials"]["token"]
    client = Octokit::Client.new(auth_token: token)
  end
end
