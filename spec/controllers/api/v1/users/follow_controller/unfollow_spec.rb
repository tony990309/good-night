require 'rails_helper'

RSpec.describe Api::V1::Users::FollowController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'unfollow'
    example.metadata[:rpdoc_action_name] = '取消追蹤使用者'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users', 'follow']

    @self_user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
    FactoryBot.create(:follow, follower: @self_user, following: @other_user)

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users/unfollow"
    @params = { user_id: @self_user.id }
  end

  describe '#create' do
    it 'should return 200 and unfollow following user', rpdoc_example_key: 200, rpdoc_example_name: 'unfollow user success' do
      @params[:following_id] = @other_user.id
      post @path, params: @params.to_json, headers: @headers
      expect(response).to have_http_status(200)
      expect(@self_user.following?(@other_user)).to be(false)
    end

    it 'should return 400 and unfollow self failed', rpdoc_example_key: 400_200, rpdoc_example_name: 'unfollow self failed' do
      @params[:following_id] = @self_user.id
      post @path, params: @params.to_json, headers: @headers
      expect(response).to have_http_status(400)
      expect(json['error_code']).to eq(400_200)
      expect(json['error_key']).to eq('invalid_following_target')
    end
  end
end
