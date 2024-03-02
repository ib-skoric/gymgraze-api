class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: '🏋️‍♂️ GymGraze: Confirm your email')
  end

  def password_reset_email(user)
    @user = user

    @token = user.signed_id(expires_in: 15.minutes, purpose: 'password_reset')

    mail(to: @user.email, subject: '🏋️‍♂️ GymGraze: Reset your password')
  end
end
