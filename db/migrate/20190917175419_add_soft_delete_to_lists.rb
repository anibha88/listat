class AddSoftDeleteToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :soft_delete, :boolean, default: false
  end
end
