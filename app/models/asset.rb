class Asset < ActiveRecord::Base
  attr_accessible :name, :description

  before_create :set_uuid

  def set_uuid
    self.uuid = UUID.generate
  end
end
