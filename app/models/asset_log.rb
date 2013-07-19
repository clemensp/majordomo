class AssetLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :asset

  validates :asset, presence: true
  validates :action, presence: true

  def self.logging_action_for user, action
    transaction do
      l = new(user: user, action: action)
      yield l
      l.save!
    end
  end

  def record_asset asset
    self.asset = asset
  end
end
