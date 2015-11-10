class PuzzlesController < ApplicationController
	def show
		@category = params.require(:category)
		@answer = Answer.new
		


		if @category == 'word'
			@puzzle_list = Puzzle.where(category: 'word')
			@puzzle = @puzzle_list.offset(rand(@puzzle_list.count)).first

			#storing the start time in the puzzle, since we cannot store it in our answer
			@puzzle.start_time = Time.now()
			@puzzle.save
		elsif @category == 'logic'
			@puzzle_list = Puzzle.where(category: 'logic')
			@puzzle = @puzzle_list.offset(rand(@puzzle_list.count)).first

			#storing the start time in the puzzle, since we cannot store it in our answer
			@puzzle.start_time = Time.now()
			@puzzle.save
		end
	end	

	
end
