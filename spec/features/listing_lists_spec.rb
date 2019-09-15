require "rails_helper" 

RSpec.feature "Listing lists" do
	before do
		@list1 = List.create(name: "List1")
		@list2 = List.create(name: "List2") 
	end

	scenario "Listing all lists" do 
		visit "/"
		expect(page).to have_content(@list1.name)
		expect(page).to have_content(@list2.name)
		expect(page).to have_link(@list1.name)
		expect(page).to have_link(@list2.name)
	end
end

