module ListsHelper
	def persisted_list_items(list_items)
		list_items.reject { |list_item| list_item.new_record? } 
	end
end
