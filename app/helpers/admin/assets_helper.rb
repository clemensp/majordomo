module Admin::AssetsHelper

  def user_choices
    choices = [["--", nil]]
    user_choices = User.all.map {|u| [u.name, u.id]}
    choices + user_choices
  end
end
