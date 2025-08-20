class Api::V1::UserListEntity < ListEntity
  expose :user_entities, as: :users

  private

  def user_entities
    @user_entities ||= Api::V1::UserEntity.represent(pagination_items, options)
  end
end
