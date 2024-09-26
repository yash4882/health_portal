class Patient < ApplicationRecord
	validates :name, :age, :gender, :contact, :health_issue, presence: true
end
