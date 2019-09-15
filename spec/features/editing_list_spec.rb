require "rails_helper"

RSpec.feature "Editing a List" do 
	before do
		@list = List.create(name: "My List")
	end

	scenario "A list gets updated successfully" do 
		visit "/"
		click_link @list.name
		click_link "Edit List"
		fill_in "Name", with: "Updated List" 
		click_button "Update List"

		expect(page).to have_content("List has been updated")
		expect(page.current_path).to eq(list_path(@list))
	end

	scenario "A list fails to update" do
		visit "/"
		click_link @list.name
		click_link "Edit List"
		fill_in "Name", with: "" 
		click_button "Update List"

		expect(page).to have_content("List has not been updated")
		expect(page.current_path).to eq(list_path(@list))
	end
end