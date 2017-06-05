class UsersController < ApplicationController
	 def home
	 	
	 end
	
	 def index
	 	current=session[:user_id]

	 	@users = User.all.where("id!=?",current )
	
	 end

	def new
	 @user = User.new
	end
	
	def show
	@user = User.find_by(params[:email])
	end

	def create
	  @user = User.new(user_params)
	  if @user.save
	  	
	    redirect_to new_session_path
	  else
	    render "new"
	  end
	  end

	private
	
	  def user_params
	   params.require(:user).permit(:fname,:lname,:username,:image,:email,:password)

	end
    end
