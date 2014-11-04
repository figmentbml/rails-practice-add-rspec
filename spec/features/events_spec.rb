require 'rails_helper'

feature "Events" do

  scenario "User edits an event" do
    Event.create!(
      description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "edit"
    fill_in "Description", with: "My awesome event"
    click_on "Update Event"

    expect(page).to have_content("My awesome event")
    expect(page).to have_no_content("My aweeesome event")
  end

  scenario "User deletes an event" do
    Event.create!(
      description: "My aweeesome event"
    )

    visit root_path
    expect(page).to have_content("My aweeesome event")
    click_on "delete"

    expect(page).to have_no_content("My aweeesome event")
  end

  scenario "User shows event and edits event" do
    Event.create!(
      description: "Event 3"
    )

    visit root_path
    expect(page).to have_content("Event 3")
    click_on "Event 3"

    expect(page).to have_content("Event 3")
    click_on "Edit"
    fill_in "Description", with: "Super Amazing Event"
    click_on "Update Event"

    expect(page).to have_content("Super Amazing Event")
    expect(page).to have_no_content("Event 3")
  end

end
