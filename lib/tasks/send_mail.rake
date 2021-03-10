namespace :send_mail do
  desc "send_mail"
  task send_mail: :environment do
    UsersMailer.daily.deliver
  end
end