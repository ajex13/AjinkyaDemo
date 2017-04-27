class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    mail to: @user.email , subject: "Sign up Successful!"
  end
end
