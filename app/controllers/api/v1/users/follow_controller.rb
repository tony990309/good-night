class Api::V1::Users::FollowController < Api::ApplicationController
  before_action :setup_user, :setup_following_user
  before_action :check_follow_target, only: [:follow, :unfollow]

  def follow
    @user.follow(@following_user)
    success_response(:ok)
  end

  def unfollow
    @user.unfollow(@following_user)
    success_response(:ok)
  end
end
