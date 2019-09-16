class List < ApplicationRecord
	validates :name, presence: true 
	has_many :list_items, dependent: :destroy
end
