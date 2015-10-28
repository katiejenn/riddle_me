class Puzzle < ActiveRecord::Base
	has_many :answers
	has_many :keywords
	has_many :solved_puzzles
	has_many :users, :through => :solved_puzzles
end

