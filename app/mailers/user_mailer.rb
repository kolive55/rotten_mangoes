class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def goodbye_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sad to see you go')
  end

end
