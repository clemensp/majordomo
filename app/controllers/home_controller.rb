class HomeController < ApplicationController
  layout "homepage"
  def index


  	redirect_to assets_url if user_signed_in?
  end
end
