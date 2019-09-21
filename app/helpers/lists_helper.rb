module ListsHelper
	def persisted_list_items(list_items, include_trash = false)
		list_items = list_items.where(soft_delete: false) unless include_trash
		list_items.reject { |list_item| list_item.new_record? } 
	end
end
