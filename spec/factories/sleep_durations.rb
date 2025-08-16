FactoryBot.define do
  factory :sleep_duration do
    trait :sleeping do
      start_time { Time.zone.now }
    end

    trait :awake do
      now = Time.zone.now
      start_time { now - 1.hour }
      end_time { now }
      duration { 3600 }
    end

    factory :sleeping_duration, traits: [:sleeping]
    factory :awake_duration, traits: [:awake]
  end
end
