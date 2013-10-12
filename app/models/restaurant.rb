class Restaurant < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 30 }
	validates :lunch_id, presence: true
	belongs_to :lunch
	belongs_to :user
	default_scope -> { order('created_at DESC') }
end
