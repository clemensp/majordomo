class UsersController < ApplicationController

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to user_path current_user
    end
  end

  def show
    if (current_user.admin? || params[:id].to_i == current_user.id)
      @user = User.find(params[:id])
      @asset_logs = AssetLog.fetch_all_for_user(current_user)
      @borrowed_assets = Asset.where("borrower_id = ? and shared_resource = true", current_user.id)
      @assigned_assets = Asset.where("borrower_id = ? and shared_resource = false", current_user.id)
    else
      redirect_to user_path current_user
    end
  end

  def edit
    if (current_user.admin? || params[:id].to_i == current_user.id)
      @user = User.find(params[:id])
    else
      redirect_to user_path current_user
    end
  end

  def update
    if (current_user.admin? || params[:id].to_i == current_user.id)
      @user = User.find(params[:id])
      @user.update_attributes!(params[:user])

      redirect_to user_path(@user)
    else
      redirect_to user_path current_user
    end
  end

end
