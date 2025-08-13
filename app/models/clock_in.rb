class ClockIn < ApplicationRecord
  belongs_to :user

  enum :action_type, [:sleep, :wake]

  def self.create_from_request(user_id, action_type)
    ClockIn.create(user_id: user_id, action_type: action_type)
  end
end
