class UsersMailer < ApplicationMailer

  def notify_user(user)
    @user = user
    mail to: @user.email, subject:"定期"
  end

  def daily
    @users = User.all
    @users.each do |user|
      UsersMailer.notify_user(user).deliver
    end

  end

end
