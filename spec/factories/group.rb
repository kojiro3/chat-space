FactoryGirl.define do

  factory :group do
    sequence(:name) { |n| "group#{n}" }
    # created_at { Faker::Time.between(5.days.ago, Time.now, :all) }
  end
end
