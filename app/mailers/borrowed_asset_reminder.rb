class BorrowedAssetReminder < ActionMailer::Base
  default from: "majordomo@nulogy.com"

  def notify_due_assets(borrower, assets)
    @borrower = borrower
    @assets = assets
    mail(
      to: borrower.email,
      subject: "Nulogy HQ Shared Assets Overdue",
      reply_to: "office@nulogy.com"
    )
  end
end
