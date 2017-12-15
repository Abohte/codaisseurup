require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe "registering as a guest for an event"
  let(:guest) {create :user}
  let(:event) {create :event}

  it "limits guest count for one guest to three" do
    registration = Registration.new(guest_count: 4)
    registration.valid?
    expect(registration.errors).to have_key(:guest_count)
  end

end
