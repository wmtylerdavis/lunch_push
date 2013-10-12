class Lunch < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	has_many :restaurants, dependent: :destroy

	def feed
		Restaurant.where("lunch_id= ?", id)
	end
end
