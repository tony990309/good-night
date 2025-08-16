module ParamsHelper
  def check_clock_in_params
    return error_response(:invalid_clock_in_action) unless ClockIn.action_types.include?(params[:action_type])
  end
end
