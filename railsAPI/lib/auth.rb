require 'jwt'

class Auth
  ALGORITHM = 'HS256'
  def self.issue(payload)
    JWT.encode (payload, Rails.application.secrets[:secret_key_base], ALGORITHM)
  end

  def self.decode(token)
    JWT.decode (token, Rails.application.secrets[:secret_key_base], true, {algorithm: ALGORITHM}).first
  end
end
