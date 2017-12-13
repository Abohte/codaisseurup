require 'rails_helper'

describe "Current user viewing their list of events" do
  before { login_as user }

  let(:user) { create :user, email: "mymail@mail.com" }
  let(:user2) { create :user, email: "other@mail.com" }

  let!(:event1) { create :event, name: "My event 1", user: user }
  let!(:event2) { create :event, name: "My event 2", user: user }
  let!(:event3) { create :event, name: "Their event", user: user2 }

  it "shows all their events" do
    visit events_path

    expect(page).to have_text("My event 1")
    expect(page).to have_text("My event 2")
  end

  it "does not show events of other users" do
    visit events_path

    expect(page).not_to have_text("Their event")
  end

end
