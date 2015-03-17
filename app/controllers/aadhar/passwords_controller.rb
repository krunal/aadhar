class Aadhar::PasswordsController < Aadhar::ApplicationController
  before_filter :authenticate, only: [:update]

  def update
    current_user.password = params[:password]
    current_user.password_confirmation = params[:password_confirmation]
    current_user.change_password = false
    if current_user.save
      render :status => 200,
           :json => { :success => true,
                      :info => "Password updated successfully",
                      :data => { :user => 
                        {
                          id: current_user.id,
                          email: current_user.email,
                          name: current_user.name
                        } }   
                    }
    else
      render :status => 200,
             :json => { :success => false,
                        :info => current_user.errors.full_messages}
    end
  end

  def reset
    @user = User.where(email: params[:email]).first
    if @user.present?
      @user.set_temporary_password
      @user.change_password = true
      @user.save
      #ResetEmailJob.set(wait: 20.seconds).perform_later(@user, @user.temp_password)
      UserMailer.reset_email(@user, @user.temp_password).deliver_later
      render :status => 200,
           :json => { :success => true,
                      :info => "Check your email",
                      :data => { :user => {
                        id: @user.id,
                        email: @user.email,
                        name: @user.name
                      } } 
                    }
    else
      render :status => 200,
           :json => { :success => false,
                      :info => "No user exist with this email address" }
    end
  end
end

