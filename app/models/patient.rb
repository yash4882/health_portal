class Patient < ApplicationRecord
	validates :name, :age, :gender, :health_issue, :blood_type, :height, :weight,  presence: true
	validates :contact, presence: true, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
end