class Api::V1::Users::FollowController < Api::ApplicationController
  before_action :setup_user
  before_action :setup_following_user, only: [:follow, :unfollow]
  before_action :check_follow_target, only: [:follow]

  def follow
    @user.follow(@following_user)
    success_response(:ok)
  end

  def unfollow
    @user.unfollow(@following_user)
    success_response(:ok)
  end

  def following
    serialize_response(:user_list, @user.following)
  end

  def followers
    serialize_response(:user_list, @user.followers)
  end

  private

  def check_follow_target
    return error_response(:invalid_following_target) if params[:following_id] == @user.id
  end
end
