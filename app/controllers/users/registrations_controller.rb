class Users::RegistrationsController < Devise::RegistrationsController

  def cancel
    super
  end

  def create
    super
    user_name = params[:user][:name]
    user_email = params[:user][:email]
    ThanksMailer.registration_confirmation(user_name,user_email).deliver unless resource.invalid?
  end

  def new
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end

end
