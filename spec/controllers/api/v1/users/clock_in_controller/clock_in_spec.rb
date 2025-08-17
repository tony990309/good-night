require 'rails_helper'

RSpec.describe Api::V1::Users::ClockInController, type: :request do
  include_context 'rpdoc'

  before(:each) do |example|
    example.metadata[:rpdoc_action_key] = 'clock_in'
    example.metadata[:rpdoc_action_name] = '建立打卡紀錄'
    example.metadata[:rpdoc_example_folders] = ['v1', 'users', 'clock_in']

    @headers = { 'Content-Type' => 'application/json' }
    @path = "/api/v1/users/clock_in"
  end

  describe '#clock_in' do
    before(:each) do
      @user = FactoryBot.create(:user)
      @params = {
        user_id: @user.id,
        action_type: 'sleep'
      }
    end

    it 'should return 200 and clock in with action_type sleep success', rpdoc_example_key: 200, rpdoc_example_name: 'clock in with action_type sleep success' do
      expect { post @path, params: @params.to_json, headers: @headers }
        .to change { ClockIn.count }.by(1)

      expect(response).to have_http_status(200)
      expect(json['data'].count).to eq(@user.reload.clock_ins.count)
      expect(@user.reload.sleeping?).to be(true)
    end

    it 'should return 200 and clock in with action_type wake success', rpdoc_example_key: 200_2, rpdoc_example_name: 'clock in with action_type wake success' do
      sleeping_user = FactoryBot.create(:sleeping_user)
      @params[:user_id] = sleeping_user.id
      @params[:action_type] = 'wake'
      expect { post @path, params: @params.to_json, headers: @headers }
        .to change { ClockIn.count }.by(1)

      expect(response).to have_http_status(200)
      expect(json['data'].count).to eq(sleeping_user.reload.clock_ins.count)
      expect(sleeping_user.reload.awake?).to be(true)
    end

    it 'should return 400_100 if clock in with action_type sleep while user is already sleeping', rpdoc_example_key: 400_100, rpdoc_example_name: 'clock in failed (user is already sleeping)' do
      sleeping_user = FactoryBot.create(:sleeping_user)
      @params[:user_id] = sleeping_user.id
      post @path, params: @params.to_json, headers: @headers

      expect(response).to have_http_status(400)
      expect(json['error_code']).to eq(400_100)
      expect(json['error_key']).to eq('user_is_sleeping')
    end

    it 'should return 400_101 if clock in with action_type wake while user is already awake', rpdoc_example_key: 400_101, rpdoc_example_name: 'clock in failed (user is already awake)' do
      awake_user = FactoryBot.create(:awake_user)
      @params[:user_id] = awake_user.id
      @params[:action_type] = 'wake'
      post @path, params: @params.to_json, headers: @headers

      expect(response).to have_http_status(400)
      expect(json['error_code']).to eq(400_101)
      expect(json['error_key']).to eq('user_is_awake')
    end
  end

end
