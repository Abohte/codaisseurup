require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("M") }

    let(:mike) { create :profile, first_name: "Mike" }
    let(:mary) { create :profile, first_name: "Mary" }
    let(:wess) { create :profile, first_name: "Wess" }

    it "returns the profiles that match the initial" do
      expect(subject).to match_array([mike, mary])
    end

    it "is sorted on first_name" do
      expect(subject).to eq([mary, mike])
    end
  end
end
