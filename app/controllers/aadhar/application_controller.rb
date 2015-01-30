class Aadhar::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
  	render :status => 401, :json => { :success => false, :info => "Unauthorized"} if !current_user.present?
  end

  def current_user
    @current_user ||= User.where(authentication_token: params[:auth_token]).first
  end

end
