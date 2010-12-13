class UserEMail < ActionMailer::Base
  default :from => "from@cyt.ch"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_e_mail.parents_mail.subject
  #
  def parents_mail(e_mail, subject, body, recipient)
    @greeting = "Hi #{recipient}"
    @content = body

    mail(:to => recipient.email, :from => e_mail, :subject => subject)
  end
end
