class BorrowedAssetNotifier < ActionMailer::Base
  default from: "majordomo@nulogy.com"

  def notify_borrowed_asset(borrower, asset)
    @borrower = borrower
    @asset = asset
    mail(
      to: borrower.email,
      subject: "Nulogy HQ Shared Asset Sign-Out",
      reply_to: "office@nulogy.com"
    )
  end
end
