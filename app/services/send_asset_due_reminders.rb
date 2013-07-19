module SendAssetDueReminders
  def self.send
    to_send = FindUsersToRemind.find
    to_send.each do |user, assets|
      BorrowedAssetReminder.notify_due_assets(user, assets).deliver
    end
  end
end
