class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.registration_confirmation.subject
  #
  def registration_confirmation(user_name)
    @user_name = user_name
    mail(
      subject: "会員登録が完了しました",
      to: "sogappi@gmail.com"
      )

    # mail to: "sogappi@gmail.com"
  end
end
