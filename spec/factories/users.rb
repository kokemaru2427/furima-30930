FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.initials(number: 2)}
    email                   {Faker::Internet.free_email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    family_name             {"山田"}
    last_name               {"太郎"}
    j_family_name           {"ヤマダ"}
    j_last_name             {"タロウ"}
    birthday                {Faker::Date.in_date_period}

  end
end