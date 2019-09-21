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

	def edit
		@list_item = ListItem.find(params[:id])
	end

	def update
		@list_item = ListItem.find(params[:id])
		if @list_item.update_attributes(list_item_params)
			flash[:notice] = "ListItem has been updated"
		else
			flash.now[:alert] = "ListItem has not been updated"
		end
		redirect_to list_path(@list)
	end

	def destroy
		@list = List.find(params[:list_id])
	    @list_item = @list.list_items.find(params[:id])	    

	if params["soft_delete"] == "true"

      @list_item.move_to_trash

      # @list.list_items.all.each do |list_item|
      #   list_item.delete
      # end
      # @list.delete
      action = "moved to trash"
    else
      @list_item.destroy
      action = "deleted"
    end
    
    flash[:notice] = "ListItem has been #{action}"
    redirect_to lists_path(@list)
	end

	def archive
	    @list_item = @list.list_items.find(params[:id])
	    @article.update_attribute(:displayed, false)

	    redirect_to article_path
  	end

	private

	def list_item_params
		params.require(:list_item).permit(:body)
	end

	def set_list
		@list = List.find(params[:list_id])
	end
end
