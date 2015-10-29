class UsersController < ApplicationController
	def index
    	@users = User.all
    	render :index
  	end

  	def new
	    @user = User.new
	    render :new
  	end

  	def create
	    user_params = params.require(:user).permit(:email, :password)
	    is_admin = params[:is_admin]

	    @user = User.create(user_params)
	    # byebug
	    if is_admin == '1'
	    	@user.is_admin = true
	    else
	    	@user.is_admin = false
	    end

	    @user.save
	    login(@user)
	    redirect_to "/users/#{@user.id}"
  	end

  	def show
    	@user = User.find(params[:id])
    	@solved_puzzles = @user.puzzles
    	@answers = @user.answers
    	render :show
  	end
end
