class SleepDuration < ApplicationRecord
  belongs_to :user

  scope :sleeping, -> { where(end_time: nil) }

  before_update :calculate_duration, if: :will_save_change_to_end_time?

  def self.setup_for(user)
    sleeping.last || create(user_id: user.id)
  end

  private

  def calculate_duration
    self.duration = (end_time - start_time).to_i
  end
end
