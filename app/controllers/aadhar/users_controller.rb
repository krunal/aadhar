class Aadhar::UsersController < Aadhar::ApplicationController

  def create
  	@user = User.new(user_params)
    @user.set_temporary_password
    @user.change_password = true
    if @user.save
      UserMailer.signup_email(@user, @user.temp_password).deliver_later
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
      render :status => 200,
             :json => { :success => false,
                        :info => @user.errors.full_messages }
    end
  end

  def user_params
  	params.require(:user).permit(:email, :name)
  end

end

