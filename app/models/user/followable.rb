module User::Followable
  extend ActiveSupport::Concern

  included do
    has_many :active_follows,  class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
    has_many :passive_follows, class_name: 'Follow', foreign_key: :following_id, dependent: :destroy
    has_many :following, through: :active_follows, source: :following
    has_many :followers, through: :passive_follows, source: :follower
  end

  def follow(following_user)
    following << following_user unless following?(following_user)
  end

  def unfollow(following_user)
    following.delete(following_user)
  end

  def following?(user)
    following.include?(user)
  end
end
