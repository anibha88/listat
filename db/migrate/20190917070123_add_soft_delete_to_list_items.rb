class AddSoftDeleteToListItems < ActiveRecord::Migration[5.2]
  def change
    add_column :list_items, :soft_delete, :boolean, default: false
  end
end
