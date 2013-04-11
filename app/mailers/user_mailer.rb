class UserMailer < ActionMailer::Base
  default from: "Registro Wuoman <master@foreachdeloper.com>"
  def created(user)
    @user = user
    email_with_name = "#{@user.name} <#{@user.email}>"
    mail :to => email_with_name , :subject => "Welcome To Wuoman, #{@user.name}"
    ##@user.email
  end
end
