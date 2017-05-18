FactoryGirl.define do
  # pass = Faker::Internet.password(8)
  
  factory :user do
    # name                    Faker::Name.name
    # email                   Faker::Internet.email
    password                pass
    password_confirmation   pass

    after(:create) do |user|
      3.times { create(:group_user, user: user, group: create(:group)) }
    end
  end
end
