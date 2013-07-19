class Asset < ActiveRecord::Base
  belongs_to :borrower, polymorphic: true

  before_create :set_uuid

  validates :borrower, presence: true, if: -> { status == BORROWED }

  BORROWED = "borrowed"
  AVAILABLE = "available"

  def self.fetch_all_borrowed_by(borrower)
    where(borrower_id: borrower.id).
      where(borrower_type: borrower.class.name)
  end

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
    self.borrower = nil
    self.status = Asset::AVAILABLE
    self.save!
  end
end
