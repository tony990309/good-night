require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'create'
    example.metadata[:rpdoc_action_name] = '建立使用者'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users']

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users"
  end

  describe '#create' do
    it 'should return 200 and creates a new user', rpdoc_example_key: 200, rpdoc_example_name: 'create user success' do
      params = { name: 'Test User' }
      expect {
        post @path, params: params.to_json, headers: @headers
      }.to change { User.count }.by(1)
      expect(response).to have_http_status(200)
      expect(json['data']['name']).to eq('Test User')
    end

    it 'should return 400_000 if name is missing', rpdoc_example_key: 400_000, rpdoc_example_name: 'create user failed (name is missing)' do
      post @path, params: {}.to_json, headers: @headers
      expect(response).to have_http_status(400)
      expect(json['error_code']).to eq(400_000)
      expect(json['error_key']).to eq('need_more_information')
    end
  end
end
