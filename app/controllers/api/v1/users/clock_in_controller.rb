class Api::V1::Users::ClockInController < Api::ApplicationController
  before_action :setup_user, only: [:clock_in]
  before_action :check_clock_in_params, only: [:clock_in]

  def clock_in
    creator = ClockIns::Creator.call(@user, params.require(:action_type))
    return error_response(creator.error) if creator.failed?
    serialize_response(:clock_in, creator.result)
  end
end
