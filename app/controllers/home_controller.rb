class HomeController < ApplicationController
  #before_filter :authenticate_user!

  def index
  	redirect_to assets_url if user_signed_in?
  end
end
