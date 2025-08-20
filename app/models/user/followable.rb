module User::Followable
  extend ActiveSupport::Concern

  included do
    has_many :active_follows,  class_name: 'Follow', foreign_key: :follower_id, dependent: :destroy
    has_many :passive_follows, class_name: 'Follow', foreign_key: :following_id, dependent: :destroy
    has_many :following, through: :active_follows, source: :following
    has_many :followers, through: :passive_follows, source: :follower
  end

  def follow(user)
    following << user unless following?(user)
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    active_follows.exists?(following_id: user.id)
  end
end
