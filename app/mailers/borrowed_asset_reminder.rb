class BorrowedAssetReminder < ActionMailer::Base
  default from: "majordomo@nulogy.com"

  def notify_due_assets(borrower, assets)
    @borrower = borrower
    @assets = assets
    mail(
      to: borrower.email,
      subject: "Shared resources overdue",
      reply_to: "wendyp@nulogy.com"
    )
  end
end
