require 'rails_helper'

describe "Viewing an individual event" do
  let(:event) { create :event, includes_food: false }

  it "shows event details" do
    visit event_path(event)

    expect(page).to have_text(event.name)
    expect(page).to have_text(event.location)
    expect(page).to have_text(event.description)
    expect(page).to have_text(event.capacity)
    expect(page).to have_text(event.price)
    expect(page).to have_text(event.starts_at)
    expect(page).to have_text(event.ends_at)
    expect(page).to have_text(event.includes_food ? "Food included" : "")
    expect(page).not_to have_text("Food included")
    expect(page).to have_text(event.includes_drinks ? "Drinks included" : "")
  end
end
