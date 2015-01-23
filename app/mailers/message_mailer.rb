class MessageMailer < ActionMailer::Base
  default from: ENV['MESSAGE_EMAIL']

  def send_message_email(name,email,subject,message)
    @name = name
    @email = email
    @subject = subject
    @message = message
    mail(to: ENV['MESSAGE_EMAIL'], subject: @subject)
  end

end
