require "spec_helper"

describe FindUsersToRemind do
  let!(:user) { create_user("name") }
  let!(:asset) { create_asset_for(user, name: "shared asset") }

  example do
    to_remind = FindUsersToRemind.find

    expected_data = {}
    expected_data[user.id.to_s] = [asset]

    to_remind.should == expected_data
  end

  it "returns assets borrowed by different users" do
    another_user = create_user("another_user")
    another_asset = create_asset_for(another_user, name: "another asset")

    to_remind = FindUsersToRemind.find

    expected_data = {}
    expected_data[user.id.to_s] = [asset]
    expected_data[another_user.id.to_s] = [another_asset]

    to_remind.should == expected_data
  end

  it "combines multiple assets borrowed by the same user" do
    another_asset = create_asset_for(user, name: "another asset")

    to_remind = FindUsersToRemind.find

    expected_data = {}
    expected_data[user.id.to_s] = [asset, another_asset]

    to_remind.should == expected_data
  end

  it "only returns shared resources" do
    not_shared_asset = create_asset_for(user, name: "not shared", shared_resource: false)

    to_remind = FindUsersToRemind.find

    expected_data = {}
    expected_data[user.id.to_s] = [asset]

    to_remind.should == expected_data
  end

  it "does not return users that only have non-shared resources borrowed" do
    another_user = create_user("another_user")
    not_shared_asset = create_asset_for(another_user, name: "not shared", shared_resource: false)

    to_remind = FindUsersToRemind.find

    expected_data = {}
    expected_data[user.id.to_s] = [asset]

    to_remind.should == expected_data
  end

  def create_user(name)
    User.create! name: name, email: "#{name}@example.com", password: "password"
  end

  def create_asset_for(user, attrs={})
    asset_attrs = {
      name: "name", shared_resource: true, status: Asset::BORROWED, borrower: user
    }.merge(attrs)
    Asset.create! asset_attrs
  end
end
