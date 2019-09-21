module SoftDeletable
  extend ActiveSupport::Concern


  included do
    scope :soft_deleted, -> { where(soft_delete: true) }
    scope :exclude_soft_deleted, -> { where(soft_delete: false) }
  end

  def move_to_trash
    update_attribute(:soft_delete, true)
  end

  def restore
    update_attribute(:soft_delete, false)
  end

  
end