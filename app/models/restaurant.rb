class Restaurant < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 30 }
	validates :lunch_id, presence: true
	belongs_to :lunch
	default_scope -> { order('created_at DESC') }
end
