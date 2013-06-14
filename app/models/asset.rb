class Asset < ActiveRecord::Base
  attr_accessible :name, :description

  belongs_to :borrower, polymorphic: true

  before_create :set_uuid

  BORROWED = "borrowed"
  AVAILABLE = "available"

  def set_uuid
    self.uuid = UUID.generate
  end

  def available?
    self.status == "available"
  end

  def borrow_for(borrower)
    self.borrower = borrower
    self.status = Asset::BORROWED
    self.save!
  end

  def return
    self.status = Asset::AVAILABLE
    self.save!
  end
end
