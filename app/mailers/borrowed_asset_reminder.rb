class BorrowedAssetReminder < ActionMailer::Base
  default from: "majordomo@example.com"

  def notify_due_assets(borrower, assets)
    @borrower = borrower
    @assets = assets
    mail(to: borrower.email)
  end
end
