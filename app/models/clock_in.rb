class ClockIn < ApplicationRecord
  belongs_to :user

  enum :action_type, [:sleep, :wake]
end
