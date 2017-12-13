require 'rails_helper'

describe "Navigating events" do
  before { login_as user }

  let(:user) { create :user }
  let!(:event) { create :event , user: user }

  it "allows navigation from the detail page to the list page" do
    visit event_path(event)

    click_link "Back"

    expect(current_path).to eq(events_path)
  end

  it "allows navigation from the list page to the detail page" do
    visit events_path

    click_link "View"

    expect(current_path).to eq(event_path(event))
  end

end
