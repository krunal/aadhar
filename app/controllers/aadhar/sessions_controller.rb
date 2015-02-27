class Aadhar::SessionsController < Aadhar::ApplicationController
  before_filter :authenticate, only: [:destroy]

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      authentication_token = AuthenticationToken.create_token(user)
      render :status => 200,
        :json => { :success => true,
                   :info => "Logged in",
                   :data => { 
                     :auth_token => authentication_token.token, 
                     :user => {
                       id: user.id,
                       email: user.email,
                       name: user.name,
                       change_password: user.change_password } }
                  }
    else
      render :status => 200,
             :json => { :success => false,
                        :info => "Invalid email or password",
                        :data => {} }
    end
  end

  def destroy
    authentication_token = AuthenticationToken.where(token: params[:auth_token], user_id: current_user.id).first
    authentication_token.destroy
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged out",
                      :data => {} }
  end



end
