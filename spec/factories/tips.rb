FactoryBot.define do
  factory :tip do
    price     {500}
    token     {"tok_abcdefghijk00000000000000000"}
    association :user
    association :novel
  end
end
