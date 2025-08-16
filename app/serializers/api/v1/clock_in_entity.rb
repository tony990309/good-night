class Api::V1::ClockInEntity < Grape::Entity
  expose :id, as: :clock_in_id
  expose :user_id
  expose :action_type

  expose :created_at do |clock_in|
    clock_in.created_at.to_i
  end
end
