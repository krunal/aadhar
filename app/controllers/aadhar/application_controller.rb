class Aadhar::ApplicationController < ActionController::API

  def authenticate
  	render :status => 401, :json => { :success => false, :info => "Unauthorized"} if !current_user.present?
  end

  def current_user
    @current_user ||= User.where(authentication_token: params[:auth_token]).first
  end

end
