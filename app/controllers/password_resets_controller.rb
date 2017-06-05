class PasswordResetsController < ApplicationController
  
  def create
  	#debugger
  @user = User.find_by(email: params[:email])
  
 if @user
 	redirect_to edit_password_reset_path(@user)
else
  redirect_to(:action=>'new')
  
end
end
 

 def edit
  @up= User.where(email: params[:email])  
  
 end

 def update
 	@up =  User.find_by(id: params[:id])

   @updated=@up.update(:password=> params[:password])
 
  if @updated
  	redirect_to new_session_path, notice: "password updated Sucessfully"

 end
 end

end
