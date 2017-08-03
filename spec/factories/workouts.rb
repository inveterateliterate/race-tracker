FactoryGirl.define do
  factory :workout do
    start_time '7:00'
    end_time '7:30'
    distance 3.25
    speed 30
    pace 8.15
    user
  end
end
