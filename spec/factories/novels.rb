FactoryBot.define do
  factory :novel do
    title       {Faker::Book.title}
    content     {Faker::Books::Lovecraft.sentence}
    association :user

    after(:build) do |novel|
      novel.image.attach(io: File.open('public/test.jpg'), filename: 'test.jpg')
    end
  end
end
