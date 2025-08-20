require 'rails_helper'

RSpec.describe Api::V1::Users::FollowController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'unfollow'
    example.metadata[:rpdoc_action_name] = '取消追蹤使用者'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users', 'follow']

    @user = FactoryBot.create(:two_following_user)

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users/unfollow"
    @params = { user_id: @user.id }
  end

  describe '#create' do
    it 'should return 200 and unfollow following user', rpdoc_example_key: 200, rpdoc_example_name: 'unfollow user success' do
      following_user = @user.following.first
      @params[:following_id] = following_user.id
      post @path, params: @params.to_json, headers: @headers
      expect(response).to have_http_status(200)
      expect(@user.following?(following_user)).to be(false)
    end
  end
end
