class ListItemsController < ApplicationController
	before_action :set_list

	def create
		@list_item = @list.list_items.build(list_item_params)
		if @list_item.save
			flash[:notice] = "ListItem has been created"
		else
			flash.now[:alert] = "ListItem has not been created"
		end
		redirect_to list_path(@list)
	end

	def destroy
		@list = List.find(params[:list_id])
	    @list_item = @list.list_items.find(params[:id])
	    @list_item.destroy
	    redirect_to list_path(@list)
	end

	private

	def list_item_params
		params.require(:list_item).permit(:body)
	end

	def set_list
		@list = List.find(params[:list_id])
	end
end
