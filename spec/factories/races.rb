FactoryGirl.define do
  factory :race do
    date { Faker::Date.between(10.days.ago, Date.today) }
    name 'Chicago Spring Half Marathon'
    distance '13.1 miles'
    user
  end
end
