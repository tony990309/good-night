FactoryBot.define do
  factory :clock_in do
    trait :sleep_action_type do action_type { ClockIn.action_types[:sleep] } end
    trait :wake_action_type do action_type { ClockIn.action_types[:wake] } end

    factory :sleep_clock_in, traits: [:sleep_action_type]
    factory :wake_clock_in, traits: [:wake_action_type]
  end
end
