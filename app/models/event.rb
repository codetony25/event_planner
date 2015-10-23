class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attends
  has_many :comments
  has_many :users, through: :attends
  has_many :users, through: :comments
  validates :name, :date, :location, :state, presence: true

	def find_attend_id current_user
		Attend.select(:id).where(user: current_user, event: self)[0].id
	end

	def attend? user
		output = false
		self.attends.each do |e|
			if e.user_id == user
				output = true
			end
		end
		return output
	end
end
