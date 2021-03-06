class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController  
  def google
    # You need to implement the method below in your model
    @user = User.find_for_open_id(env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:alert] = "You must sign in with a valid Nulogy email"
      redirect_to root_url
    end
  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
