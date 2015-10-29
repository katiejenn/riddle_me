class User < ActiveRecord::Base
	has_secure_password
	
	has_many :answers
	has_many :solved_puzzles
	has_many :puzzles, :through => :solved_puzzles

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
