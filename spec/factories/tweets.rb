FactoryBot.define do
  factory :tweet do
    date { Faker::Date.between(2.days.ago, Date.today) }
    content 'New tweet!'
    user
  end
end
