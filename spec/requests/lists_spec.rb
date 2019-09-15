require "rails_helper"

RSpec.describe "Lists", type: :request do
	before do
		@list = List.create(name: "Test List")
	end 

	describe 'GET /lists/:id' do
		context 'With existing list' do
			before { get "/lists/#{@list.id}" }

			it "handles existing list" do
				expect(response.status).to eq 200
			end
		end

		context 'With non-existing list' do
			before { get "/lists/xxx" }

			it "handles non-existing list" do
				expect(response.status).to eq 302
				flash_message = "The list you are looking for could not be found"
				expect(flash[:alert]).to eq flash_message
			end
		end
	end
end