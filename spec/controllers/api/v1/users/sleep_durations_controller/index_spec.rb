require 'rails_helper'

RSpec.describe Api::V1::SleepDurationsController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'index'
    example.metadata[:rpdoc_action_name] = '取得睡眠紀錄列表'
    example.metadata[:rpdoc_example_folders] = ['v1', 'sleep_durations']

    @user = FactoryBot.create(:two_following_user)

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/sleep_durations"
    @params = {
      user_id: @user.id,
      target: 'following'
    }
  end

  describe '#index' do
    it 'should return 200 and get all sleep durations ordered by duration desc', rpdoc_example_key: 200, rpdoc_example_name: 'get sleep durations success' do
      get "#{@path}?#{URI.encode_www_form(@params)}", headers: @headers

      expect(response).to have_http_status(200)
      expect(json['data']['sleep_durations']).to be_an(Array)
      expect(json['data']['sleep_durations'].length).to eq(1)
    end
  end
end