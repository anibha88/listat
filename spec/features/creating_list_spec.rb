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

	scenario "List creation fails" do 
		#actions
		visit "/"
		click_link 'New List'
		fill_in "Name", with: ""
		click_button "Create List"

		#expectations
		expect(page).to have_content("List has not been created")
		expect(page).to have_content("Name can't be blank")
	end
end
