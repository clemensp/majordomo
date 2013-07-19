layout "homepage"

class HomeController < ApplicationController
  def index
  	redirect_to assets_url if user_signed_in?
  end
end
