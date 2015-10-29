class AnswersController < ApplicationController
	def index
		@answers = Answer.where(puzzle_id: params[:id])
		# byebug

	end

	def new
		@answer = Answer.new
		@puzzle = Puzzle.find(1)
	end

	def create
		@answer = Answer.new(answer_params)
		@puzzle= Puzzle.find(params[:id])
		@answer.puzzle_id = @puzzle.id

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

		if check_answer(@answer, @puzzle)
			@message = "Congratulations! Your answer is correct!"
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

			# arr = answer.text.downcase.split(' ')
			# keyword_check = {}
			# keywords = Keyword.where(puzzle_id: puzzle.id)

			# #create a new hash that assigns each keyword as the key and value is initialized as false
			# keywords.each do |x|
			# 	keyword_check[x.text] = false
			# end

			# #if a keyword is found in the answer, it's value is set to true
			# arr.each do |x|
			# 	keywords.each do |y|
			# 		byebug
			# 		if x.eql? y.text or x.include? y.text then
			# 			keyword_check[x] = true
			# 		end
			# 	end
			# end
			# # byebug

			# #check if all the values in the hash are true
			# all_values_true = true
			# byebug
			# keywords.each do |x|
			# 	if keyword_check[x.text] == false
			# 		all_values_true = false
			# 	end
			# end

			# #if all the key values are true, all keywords have been matched
			# if all_values_true == true
			# 	return true
			# else
			# 	return false
			# end


			keywords = Keyword.where(puzzle_id: puzzle.id)
			keyword_arr = []

			keywords.each do |x|
				keyword_arr.push(x.text)
			end


			answer = answer.text
			keyword_arr.all? {|word| answer.downcase.match(word) }

		end


end
