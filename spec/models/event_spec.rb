require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    # it "is invalid without a name" do
    #   event = Event.new(name: nil)
    #   event.valid?
    #   expect(event.errors).to have_key(:name)
    # end
    it { is_expected.to validate_presence_of (:name) }

    it "is invalid without a description" do
      event = Event.new(description: nil)
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid with a description longer than 500 characters" do
      event = Event.new(description: "x"*501)
      event.valid?
      expect(event.errors).to have_key(:description)
    end

    it "is invalid without a start date" do
      event = Event.new(starts_at: nil)
      event.valid?
      expect(event.errors).to have_key(:starts_at)
    end

    it "is invalid without an end date" do
      event = Event.new(ends_at: nil)
      event.valid?
      expect(event.errors).to have_key(:ends_at)
    end

    it "is invalid if the endtime is before the starttime" do
      event = Event.new(ends_at: "2017,12,22", starts_at: "2017,12,24")
      event.valid?
      expect(event.errors).to have_key(:expiration_date)
    end

  end

  describe "#bargain?" do
    let(:bargain_event) { create :event, price: 2 }
    let(:non_bargain_event) { create :event, price: 20 }

    it "returns true if the price is smaller than 10 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
    let!(:event1) { create :event, price: 10 }
    let!(:event2) { create :event, price: 25 }
    let!(:event3) { create :event, price: 5 }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_price).to eq([event3, event1, event2])
    end
  end
end
