module UserHelper
  def setup_user
    @user = User.find_by_id(params[:user_id])
    return error_response(:user_not_found) if @user.nil?
  end

  def setup_following_user
    @following_user = User.find_by_id(params[:following_id])
    return error_response(:user_not_found) if @following_user.nil?
  end
end