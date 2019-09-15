require "rails_helper"

RSpec.feature "Deleting a List" do 
	before do
		@list = List.create(name: "My List")
	end

	scenario "To delete a list" do
		visit "/"
		click_link @list.name
		click_link "Delete List"

		expect(page).to have_content("List has been deleted")
		expect(current_path).to eq(lists_path)
	end
end