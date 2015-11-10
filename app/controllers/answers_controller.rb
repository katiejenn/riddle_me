class AnswersController < ApplicationController
	def index
		@answers = Answer.where(puzzle_id: params[:id])
		@users = User.all

	end

	def new
		@answer = Answer.new
		@puzzle = Puzzle.find(1)
	end

	def create
		@answer = Answer.new(answer_params)
		@puzzle= Puzzle.find(params[:id])
		@answer.puzzle_id = @puzzle.id
		if current_user
			current_user.answers << @answer
			current_user.puzzles << @puzzle
		else
			guest_user = User.find(6)
			guest_user.answers << @answer
			guest_user.puzzles << @puzzle
		end
			

		if @answer.save
			redirect_to "/answers/#{@answer.id}?puzzle_id=#{@puzzle.id}"
		else
			render :status
		end
	end

	def show
		@puzzle_id = params.require(:puzzle_id)
		@puzzle = Puzzle.find(@puzzle_id)
		@answer = Answer.find(params[:id])
		@answer.end_time = Time.now()

		#The start time for the riddle solving was stored in puzzle because we cannot store it in answer
		@answer.completion_time = @answer.end_time - @puzzle.start_time
		@answer.save

		if check_answer(@answer, @puzzle)
			@message = "Congratulations! Your answer is correct!"
			@answer.accepted = true
			@answer.save
			@answer_is_correct = true
		else
			@message = "Sorry, you were not correct."
			@options = ['Click here ', 'to try again ', 'or ', 'Reveal the Answer!']
			@answer_is_correct = false
		end

	end

	private
		def answer_params
			params.require(:answer).permit(:text)
		end

		#check each word in the array. If all the keywords were found in the user's answer, the answer is correct
		def check_answer(answer, puzzle)


			keywords = Keyword.where(puzzle_id: puzzle.id)
			keyword_arr = []

			keywords.each do |x|
				keyword_arr.push(x.text)
			end

             
			answer = answer.text
			keyword_arr.all? {|word| answer.downcase.match(word) }

		end


end
