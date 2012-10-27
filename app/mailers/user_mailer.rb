class UserMailer < ActionMailer::Base
  default :from => "dvorec@dnttm.ru"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
  end
end