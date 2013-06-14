class Asset < ActiveRecord::Base
  attr_accessible :name, :description

  before_create :set_uuid

  BORROWED = "borrowed"
  AVAILABLE = "available"

  def set_uuid
    self.uuid = UUID.generate
  end

  def available?
    self.status == "available"
  end

  def borrow_for(borrowed_id)
    self.borrower_id = borrower_id
    self.status = Asset::BORROWED
    self.save!
  end

  def return
    self.status = Asset::AVAILABLE
    self.save!
  end
end
