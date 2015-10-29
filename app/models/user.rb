class User < ActiveRecord::Base
	has_secure_password
	
	has_many :answers
	has_many :solved_puzzles
	has_many :puzzles, :through => :solved_puzzles
end
