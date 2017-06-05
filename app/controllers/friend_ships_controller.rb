
class FriendShipsController < ApplicationController

def create

 @friendship_requested = current_user.friend_ships.build(:friend_id => params[:friend_id],:accepted => false)
		 	@user = User.find_by(id:  session[:user_id])

		
		@friendship_pending = @user.friend_ships.build(friend_id: current_user.id, accepted: true) 
		
		if @friendship_requested.save && @friendship_pending.save		
           
	        flash[:notice] = "Friend requested."
	        redirect_to user_path(current_user)
	      else
	        flash[:error] = "Unable to request friendship."
	        redirect_to user_path(current_user)
	      end
	      end
	     
	     
	     def update
         update_user_accepted = Friend_ship.where(:user_id => current_user.id, friend_id: params[:id] )
         update_friend_accepted = Friends_hip.where(:user_id => params[:id], friend_id: current_user.id )
          if update_user_accepted.update(accepted: true) && update_friend_accepted.update(accepted: true)
                flash [:notice] =>"Successfully confirmed friend!"

            redirect_to user_path(current_user)
	      else
	      	
	        redirect_to user_path(current_user)
	      end
	      end

	    def destroy
           friend_ship_to_delete = Friend_ship.where(user_id: current_user.id, friend_id: params[:id]).first
           reverse_friend_ship_to_delete = Friend_ship.where(user_id: params[:id], friend_id: current_user).first

	     if friend_ship_to_delete.destroy && reverse_friend_ship_to_delete.destroy
	     	flash[:notice] = "friendship destroyed"
	     else

	     	      flash[:notice] = "Removed friendship."
	     	 
	     redirect_to user_path(current_user)
	  end
	    end
	end