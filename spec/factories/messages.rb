FactoryGirl.define do
  
  factory :message do
    body      'hello world!'
    image     'aaaaa'
    association :group
    association :user
  end

  factory :group do
    name 'group1'
  end

  factory :user do
    name                'kojiro'
    email                   'aaa@gmail.com'
    password                '00000000'
    password_confirmation   '00000000'
  end

end
