class SessionsController < ApplicationController



	def create
	 user = User.find_by(email: params[:email])
	 @user=user
	 if user && user.authenticate(params[:password])
	   session[:user_id] = @user.id
	    flash[:notice] = "Login sucessfully."
	 	redirect_to(:controller=>'users',:action=>'show')
	  else
	 	render 'new'
	  end
	  end


	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end

	end
