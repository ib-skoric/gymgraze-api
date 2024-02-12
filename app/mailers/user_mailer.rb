class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    @confirmation_token = @user.confirmation_token
    mail(to: @user.email, subject: '🏋️‍♂️ GymGraze: Confirm your email')
  end
end
