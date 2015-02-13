FactoryGirl.define do
  factory :support do
    sequence(:name) {|n| "#{Faker::Company.bs}-#{n}"}
    message Faker::Lorem.paragraph
  end

end
