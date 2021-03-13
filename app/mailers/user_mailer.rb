class UserMailer < ApplicationMailer
  default from: 'noreply@fairwaysocial.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.login_email.subject
  #
  def login_email(user)
    @greeting = "Hi"
    @name = user.name
    # mail to: user.email
    mail(to: user.email,from: "admin@admin.com" , subject:"New User Submission")
    mail.attachments['filename.jpg'] = File.read('/home/shakir/Downloads/roaring3.jpg')
  end
end
