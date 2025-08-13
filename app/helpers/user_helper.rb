module UserHelper
  def setup_user
    @user = User.find_by_id(params[:user_id])
    return error_response(:user_not_found) if @user.nil?
  end
end