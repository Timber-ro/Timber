FactoryGirl.define do
  factory :contractor do
    sequence(:email)            { |n| "person#{n}@example.com" }
    sequence(:name)             { |n| "John Doe #{n}" }
    password                    "asdfasdf"
    password_confirmation       "asdfasdf"
  end
end
