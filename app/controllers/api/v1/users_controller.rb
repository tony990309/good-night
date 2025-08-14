class Api::V1::UsersController < Api::ApplicationController
  before_action :setup_user, only: [:show]

  def index
    users = User.all
    serialize_response(:user, users)
  end

  def show
    serialize_response(:user, @user)
  end

  def create
    user = User.create(name: params.require(:name))
    serialize_response(:user, user)
  end

  def search
    search_term = ActiveRecord::Base.sanitize_sql_like(params.require(:term).to_s)
    users = User.where("name ILIKE ?", "%#{search_term}%")
    serialize_response(:user, users)
  end
end
