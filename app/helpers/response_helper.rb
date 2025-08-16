module ResponseHelper
  def success_response(data = {})
    render status: 200, json: { data: data }
  end

  def error_response(key, error_message = nil, error_data = {})
    render_content = ErrorResponse.to_api(key, error_message).deep_dup
    render_content[:json].merge!(error_data) if error_data.present?
    render_content[:json]['error_message'] ||= key if render_content[:json]['error_code'] == 500000
    render(render_content)
  end

  def serialize_response(serializer_name, resource, **options)
    controller_name = controller_path.classify
    serializer_class_name = "#{serializer_name.to_s.camelize}Serializer"
    serializer = controller_name.gsub(/Api::(\w+)::\S+$/, "Api::#{'\1'}::#{serializer_class_name}").safe_constantize || serializer_class_name.safe_constantize
    success_response(serializer.represent(resource, options))
  end
end
