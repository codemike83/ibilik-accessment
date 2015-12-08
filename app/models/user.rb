class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, uniqueness: true
	validates :email, :password, presence: true
	validates :password, length: {minimum: 6}

	has_secure_password

	has_many :posts
	has_many :comments

end
