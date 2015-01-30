class Aadhar::UsersController < ApplicationController
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  #skip_before_filter :authenticate

  def create
  	@user = User.new(user_params)
    @user.set_temporary_password
    @user.change_password = true
    if @user.save
      #RegistrationEmailJob.set(wait: 20.seconds).perform_later(@user, @user.temp_password)
      #UserMailer.signup_email(@user, @user.temp_password).deliver_later
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { 
                        :user => {
                          id: @user.id,
                          email: @user.email,
                          name: @user.name
                          } } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @user.errors }
    end
  end

  def user_params
  	params.require(:user).permit(:email, :name)
  end

end

