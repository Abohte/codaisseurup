require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with event" do
    let(:user) { create :user }
    let!(:event) { create :event, user: user }

    it "has many events" do
      event1 = user.events.new
      event2 = user.events.new

      expect(user.events).to include(event1)
      expect(user.events).to include(event2)
    end

    it "deletes associated events" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
  end

  describe "association with registration" do
    let(:guest) {create :user, email: "guest@up.com"}
    let(:host) {create :user, email: "host@up.com"}

    let!(:event) {create :event, user: host}
    let!(:registration) {create :registration, event: event, user: guest }

    it "has attendents at events" do
      expect(guest.attended_events).to include(event)
    end
  end
end
