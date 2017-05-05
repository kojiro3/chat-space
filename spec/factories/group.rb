FactoryGirl.define do

  factory :group do
    name 'group1'
    created_at { Faker::Time.between(5.days.ago, Time.now, :all) }
  end
end
