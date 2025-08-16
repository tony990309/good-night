class Api::V1::ClockInsController < Api::ApplicationController
  before_action :setup_user, only: [:create]
  before_action :check_clock_in_params, only: [:create]

  def create
    creator = ClockIns::Creator.call(@user, params.require(:action_type))
    return error_response(creator.error) if creator.failed?
    serialize_response(:clock_in, creator.result)
  end
end
