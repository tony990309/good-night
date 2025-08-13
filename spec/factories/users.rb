FactoryBot.define do
  factory :user do
    name { 'user' }

    trait :create_sleeping_duration do
      name { 'sleeping_user' }
      after(:create) do |user|
        create(:sleeping_duration, user: user)
      end
    end

    trait :create_awake_duration do
      name { 'awake_user' }
      after(:create) do |user|
        create(:awake_duration, user: user)
      end
    end

    factory :sleeping_user, traits: [:create_sleeping_duration]
    factory :awake_user, traits: [:create_awake_duration]
  end
end
