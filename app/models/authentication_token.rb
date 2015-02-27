class AuthenticationToken < ActiveRecord::Base
	belongs_to :user

	class << self
	  def generate_token
        token = loop do
          random_token = SecureRandom.urlsafe_base64(nil, false)
          break random_token unless AuthenticationToken.exists?(token: random_token)
        end

        return token
      end

      def create_token(user)
      	authentication_token = AuthenticationToken.create!(user_id: user.id, token: generate_token)
      	return authentication_token
      end
    end

end