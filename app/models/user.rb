class User < ActiveRecord::Base
  attr_encrypted :access_token, key: Rails.application.secrets.encryption_key
end
