require "rails_helper"

RSpec.feature "Showing an Article" do
	before do
		@list = List.create(name: "My List")
	end

	scenario "A user lists all articles" do
		visit "/"
		click_link @list.name
		expect(page).to have_content(@list.name) 
		expect(current_path).to eq(list_path(@list))
	end 
end