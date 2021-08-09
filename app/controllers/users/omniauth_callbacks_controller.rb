class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback("facebook")
  end

  def google_oauth2
    generic_callback("google_oauth2")
  end

  def twitter
    generic_callback("twitter")
  end

  def generic_callback _provider
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      log_in @user
      flash[:success] = t("users.new.welcome")
      redirect_back_or @user
    else
      flash[:error] = t("sessions.new.error")
      redirect_to root_url
    end
  end

  def failure
    redirect_to root_url
  end 
end
