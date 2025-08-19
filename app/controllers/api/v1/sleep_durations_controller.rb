class Api::V1::SleepDurationsController < Api::ApplicationController
  before_action :setup_user

  def index
    searcher = SleepDurationSearcher.call(@user, sleep_duration_params, pagination_params)
    return error_response(searcher.error) if searcher.failed?
    serialize_response(:sleep_duration_list, searcher.result)
  end

  private

  def sleep_duration_params
    params.permit(:target, :start_time, :end_time)
  end
end
