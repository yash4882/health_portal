class User < ApplicationRecord
	has_secure_password

	has_many :patients

	enum role: [:receptionist, :doctor]
	
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	normalizes :email, with: ->(email) {email.strip.downcase}

	generates_token_for :password_reset, expires_in: 5.minutes do
		password_salt&.last(10)
	end

	generates_token_for :email_confirmation, expires_in: 5.minutes do
		email
	end
end
