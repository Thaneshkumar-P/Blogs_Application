class SignUpMailer < ApplicationMailer

  def send_email(user)
    @user = user
    mail(to: user.email, subject: "This is blogs website!!")
  end
end
