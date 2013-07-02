class NotificationMailer < ActionMailer::Base
  default from: "offenerrat@gmail.com"
  
  def authentication(notification)
    @notification = notification
    mail(to: notification.email, subject: 'Offener Rat Ms')
  end
end
