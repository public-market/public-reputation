FactoryBot.define do
  factory :rating do
    api_user
    sender
    receiver
    value { 1 }
  end
end
