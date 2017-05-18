FactoryGirl.define do
  
  factory :message do
    body      'hello world!'
    image     'aaaaa'
    user
    group
    # created_at { Faker::Time.between(5.days.ago, Time.now, :all) }
  end
end
