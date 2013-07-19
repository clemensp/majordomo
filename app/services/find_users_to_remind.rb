module FindUsersToRemind
  def self.find
    borrowers = self.users_with_borrowed_assets


    borrowers.inject({}) do |h, borrower|
      h[borrower.id.to_s] = Asset.fetch_all_borrowed_by(borrower).where(shared_resource: true)
      h.reject{|borrower, borrowed_assets| borrowed_assets.blank?}
    end
  end

  def self.users_with_borrowed_assets
    Asset.where(status: Asset::BORROWED).map(&:borrower).uniq
  end
end
