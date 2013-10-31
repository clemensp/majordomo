class User < ActiveRecord::Base
  has_many :assets, as: :borrower
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable, :registerable, :recoverable, :rememberable, and :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body

  def admin?
    self.admin
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.where(email: data["email"]).first
      user
    else 
      #return unless Nulogy email
      return User.new unless data["email"].split("@").last == "nulogy.com"

      # Create a user with a stub password.
      User.create!(:email => data["email"], name: data["name"], :password => Devise.friendly_token[0,20])
    end
  end
end
