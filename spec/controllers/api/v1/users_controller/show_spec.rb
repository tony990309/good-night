require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'show'
    example.metadata[:rpdoc_action_name] = '取得使用者資訊'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users']

    @headers = { 'Content-Type' => 'application/json' }
  end

  describe '#show' do
    it 'should return 200 and return the user by id', rpdoc_example_key: 200, rpdoc_example_name: 'get user success' do
      user = FactoryBot.create(:user)
      path = "/api/v1/users/#{user.id}"
      get path, headers: @headers
      expect(response).to have_http_status(200)
      expect(json['data']['user_id']).to eq(user.id)
    end

    it 'should return 404_001 if user not found', rpdoc_example_key: 404_001, rpdoc_example_name: 'get user failed (user not found)' do
      get '/api/v1/users/0', headers: @headers
      expect(response).to have_http_status(404)
      expect(json['error_code']).to eq(404_001)
      expect(json['error_key']).to eq('user_not_found')
    end
  end
end
