class UserMailer < ActionMailer::Base
  default from: "hello@iclickishare.com"
  layout 'aadhar/mailer'
  def signup_email(user, temp_password)
  	@user = user
    @temp_password = temp_password
    @subject = 'Welcome to oneClick!'
    mail(to: @user.email, subject: @subject)
  end

  def reset_email(user, temp_password)
  	@user = user
    @temp_password = temp_password
    @subject = 'Password Reset'
    mail(to: @user.email, subject: @subject)
  end
end

