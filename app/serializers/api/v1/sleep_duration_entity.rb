class Api::V1::SleepDurationEntity < Grape::Entity
  expose :id, as: :sleep_duration_id
  expose :user_id
  expose :duration

  expose :user_name do |sleep_duration|
    sleep_duration.user.name
  end

  expose :start_time do |sleep_duration|
    sleep_duration.start_time&.to_i
  end

  expose :end_time do |sleep_duration|
    sleep_duration.end_time&.to_i
  end

  expose :created_at do |sleep_duration|
    sleep_duration.created_at.to_i
  end
end
