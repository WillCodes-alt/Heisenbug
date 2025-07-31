class UserMailer < ApplicationMailer
  def welcome_email

    mail(to: 'munnakhan0101@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
