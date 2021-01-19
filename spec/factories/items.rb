FactoryBot.define do
  factory :item do
    name                    {Faker::Name.initials(number: 2)}
    explanation             {Faker::Name.initials(number: 2)}
    category_id             { 2 }
    state_id                { 2 }
    shipping_charge_id      { 2 }
    prefecture_id           { 2 }
    shipping_date_id        { 2 }
    price                   { 1000 }
    
    association :user

    
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
