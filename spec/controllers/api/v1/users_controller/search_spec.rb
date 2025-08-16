require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'search'
    example.metadata[:rpdoc_action_name] = '搜尋使用者'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users']

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users/search"
  end

  describe '#search' do
    it 'should return 200 and get users matching the search term', rpdoc_example_key: 200, rpdoc_example_name: 'search user success' do
      FactoryBot.create(:user, name: 'Alice')
      FactoryBot.create(:user, name: 'Bob')
      params = { term: 'ali' }
      get "#{@path}?#{URI.encode_www_form(params)}", headers: @headers
      expect(response).to have_http_status(200)
      expect(json['data'].first['name']).to eq('Alice')
    end
  end
end
