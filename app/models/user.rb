class User < ApplicationRecord
  has_many :clock_ins, dependent: :destroy
  has_many :sleep_durations, dependent: :destroy
  has_one :sleeping_duration, -> { sleeping }, class_name: 'SleepDuration'

  include Followable

  def sleeping?
    sleeping_duration.present?
  end

  def awake?
    !sleeping?
  end
end
