require "rails_helper"

RSpec.feature "Creating Lists" do 
	scenario "A list gets created successfully" do 
		# actions 
		visit "/"
		click_link "New List"
		fill_in "Name", with: "Creating a list"
		click_button "Create List"

		#expectations
		expect(page).to have_content("List has been created successfully")
		expect(page.current_path).to eq(lists_path)
	end
end
