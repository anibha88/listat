class ListItem < ApplicationRecord
  belongs_to :list
  validates :body, presence: true
end
