module CheckHelper
  def check_follow_target
    return error_response(:invalid_following_target) if params[:following_id] == @user.id
  end
end
