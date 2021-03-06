require 'rails_helper'

describe "shared/_navbar.html.erb" do
  context "not signed-in" do
    it "shows log in / sign up buttons" do
      render
      expect(rendered).to have_content "Log In"
      expect(rendered).to have_content "Sign Up"
    end
  end

  context "signed in" do
    before { sign_in user }

    context "without profile" do
      let(:user) { create :user }

      it "renders email" do
        render
        expect(rendered).to have_content user.email
      end
    end

    context "with profile" do
      let(:profile) { build :profile }
      let(:user) { create :user, profile: profile }

      it "renders first and last name" do
        render
        #expect(rendered).to have_content profile.first_name
        expect(rendered).to have_content profile.full_name
      end
    end
  end
end
