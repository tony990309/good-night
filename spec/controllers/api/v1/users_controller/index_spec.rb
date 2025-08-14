require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'index'
    example.metadata[:rpdoc_action_name] = '取得使用者列表'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users']

    @headers = { 'Content-Type' => 'application/json' }
    @base_path = "/api/v1/users"
  end

  describe '#index' do
    it 'should return 200 and return all users success' do
      FactoryBot.create_list(:user, 3)
      get @base_path, headers: @headers
      expect(response).to have_http_status(200)
      expect(json['data'].length).to eq(User.count)
    end
  end
end
