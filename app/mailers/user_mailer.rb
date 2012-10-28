class UserMailer < ActionMailer::Base
  default :from => "dvorec@dnttm.ru"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
  end

  def change_world_reg_confirmation(user)
    @user = user
    mail(:to => @user.email, :subject => "Регистрация в конкурсе проектов 'Измени мир к лучшему!'")
#    mail(:to => 'fvompe@dnttm.ru', :subject => "Конкурс 'Измени мир': добавлен новый проект")
  end

end