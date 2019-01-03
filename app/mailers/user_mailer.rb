class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.parent_email, subject: 'Welcome to our Sea Card!')
  end

  def progress_email(user)
    @user = user
    mail(to: @user.parent_email, subject: `#{@user.child_username} Requested Progress E-mail`)
  end
end
