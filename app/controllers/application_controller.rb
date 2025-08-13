class ApplicationController < ActionController::API
  include ParamsHelper
  include ResponseHelper

  rescue_from ActionController::ParameterMissing do |e|
    error_response(:need_more_information, "#{e.message} (#{e.backtrace.first})")
  end
end
