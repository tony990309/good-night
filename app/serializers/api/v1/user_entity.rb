class Api::V1::UserEntity < Grape::Entity
  expose :id, as: :user_id
  expose :name

  expose :created_at do |user|
    user.created_at.to_i
  end
end
