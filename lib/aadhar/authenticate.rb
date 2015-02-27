module Aadhar
	module Authenticate
		extend ActiveSupport::Concern

		def authenticate
			render :status => 401, :json => { :success => false, :info => "Unauthorized"} if !current_user.present?
		end

	    def current_user
	        @current_user ||= begin
	          authentication = AuthenticationToken.where(token: params[:auth_token]).first
	          authentication.present? ? authentication.user : nil
	        end
	    end
	end
end