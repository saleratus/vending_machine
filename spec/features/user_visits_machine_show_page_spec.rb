require 'rails_helper'

feature "When a user visits the vending machine show page" do
  scenario "they see a list of snacks in that machine" do
    snack_1 = Snack.create(name: "Doritos")
    snack_2 = Snack.create(name: "Sun Chips")
    sam = Owner.create(name: "Sam's Snacks")
    machine = sam.machines.create(location: "Don's Mixed Drinks", snacks: [snack_1, snack_2])


    visit machine_path(machine)

    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content(snack_1.name)
    expect(page).to have_content(snack_2.name)
  end
end
