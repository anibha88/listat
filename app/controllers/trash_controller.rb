class TrashController < ApplicationController
  def index
    @trash_lists = []
    @trash_list_items = []
    if params[:type].present?
      if params[:type] == 'list'
        @trash_lists = List.soft_deleted       
       elsif params[:type] == 'list_items'         
         @trash_list_items = ListItem.soft_deleted
       end  
    else
      @trash_lists = List.soft_deleted
      @trash_list_items = ListItem.soft_deleted
    end    	  	
  end

  def restore
    params[:type] = params[:type].presence || 'list'
    if params[:type] == 'list'
    	 list = List.find(params["id"])
    	 list.restore
    	 flash[:notice] = "The #{params[:type]} has been taken out of trash."
     elsif params[:type] == 'list_item'
       list_item = ListItem.find(params["id"])
        if list_item.list.soft_delete == true
          flash[:notice] = "Please restore the list associated with this list item."
        else
          list_item.restore 
          flash[:notice] = "List Item has been taken out of trash."
        end
     end
     redirect_to trash_index_path
  end
end
