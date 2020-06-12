class FriendshipsController < ApplicationController
    def create
      friend = User.find(params[:friend])
      current_user.friendships.build(friend_id: friend.id)

      if current_user.save
        flash[:notice] = "You are friends now"
      else 
        flash[:alert] = "Something went wrong, please try again later"
      end
      redirect_to my_friends_path
    end

    def destroy
      friendship = current_user.friendships.where(friend_id: params[:id]).first
      friendship.destroy
      flash[:notice] = "You are not following this person"
      redirect_to my_friends_path
    end
end