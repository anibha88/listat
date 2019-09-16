require "rails_helper"

RSpec.feature "Adding ListItems to Lists" do 
	before do
		@list = List.create(name: 'Test List')
	end

	scenario 'create a listitem to a list' do
		visit "/"
		click_link @list.name
		fill_in "New ListItem", with: "Item List Todo1"
		click_button "Add ListItem"

		expect(page).to have_content("ListItem has been created")
		expect(page).to have_content("Item List Todo1")
		expect(current_path).to eq(list_path(@list.id))
	end
end