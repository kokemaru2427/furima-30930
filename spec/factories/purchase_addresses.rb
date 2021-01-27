FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-1234"}
    prefecture {1}
    municipalities {"神戸市池田町"}
    residence {"10-10"}
    building {"神戸ハイツ"}
    phone_number {00000000000}
  end
end
