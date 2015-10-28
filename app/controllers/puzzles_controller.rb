class PuzzlesController < ApplicationController
	def show
		@category = params.require(:category)
		@answer = Answer.new

		if @category == 'word'
			@puzzle_list = Puzzle.where(category: 'word')
			@puzzle = @puzzle_list.offset(rand(@puzzle_list.count)).first
		elsif @category == 'logic'
			@puzzle_list = Puzzle.where(category: 'logic')
			@puzzle = @puzzle_list.offset(rand(@puzzle_list.count)).first
		end
	end	

	
end
