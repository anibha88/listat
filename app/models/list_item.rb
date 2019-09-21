class ListItem < ApplicationRecord
  belongs_to :list
  validates :body, presence: true

  include SoftDeletable

  def self.destroy(params)
	  list = List.find(params[:list_id])
    list_item = list.list_items.find(params[:id])	    
	  if params["soft_delete"] == "true"
      list_item.move_to_trash
      action = "moved to trash"
    else
      list_item.destroy
      action = "deleted"
    end
    action
  end	

end
