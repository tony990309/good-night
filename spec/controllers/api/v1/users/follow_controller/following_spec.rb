require 'rails_helper'

RSpec.describe Api::V1::Users::FollowController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'following'
    example.metadata[:rpdoc_action_name] = '取得追蹤中用戶列表'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users', 'follow']

    @user = FactoryBot.create(:two_following_user)

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users/following"
    @params = { user_id: @user.id }
  end

  describe '#following' do
    it 'should return 200 and get user following list', rpdoc_example_key: 200, rpdoc_example_name: 'get following success' do
      get "#{@path}?#{URI.encode_www_form(@params)}", headers: @headers
      # binding.pry
      expect(response).to have_http_status(200)
      expect(json['data']['users']).to be_an(Array)
      expect(json['data']['users'].length).to eq(2)
    end

    it 'should return 404_001 if user not found', rpdoc_example_key: 404_001, rpdoc_example_name: 'get following failed (user not found)' do
      @params[:user_id] = 0
      get "#{@path}?#{URI.encode_www_form(@params)}", headers: @headers
      expect(response).to have_http_status(404)
      expect(json['error_code']).to eq(404_001)
      expect(json['error_key']).to eq('user_not_found')
    end
  end
end
