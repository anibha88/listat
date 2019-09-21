class List < ApplicationRecord
	validates :name, presence: true 
	has_many :list_items, dependent: :destroy

	after_update :update_list_items_soft_delete

	include SoftDeletable


	def update_list_items_soft_delete
		if soft_delete == true
	  		list_items.each{|c| c.move_to_trash}
	  	elsif soft_delete == false
			list_items.each{|c| c.restore}	  			
	  	end	
	end

	def remove(params)
	  if params["soft_delete"] == "true"
        self.move_to_trash
        action = "moved to trash"
      else
        self.destroy
        action = "deleted"
      end
      action
	end
end
