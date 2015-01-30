class UserMailer < ActionMailer::Base
  default from: "support@oneclick.com"
  layout 'aadhar/mailer'
  def signup_email(user, temp_password)
  	@user = user
    @temp_password = temp_password
    mail(to: @user.email, subject: 'OneClick Account Information')
  end

  def reset_email(user, temp_password)
  	@user = user
    @temp_password = temp_password
    mail(to: @user.email, subject: 'New password for OneClick')
  end
end

