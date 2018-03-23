FactoryBot.define do
  factory :rating do
    sender
    receiver
    value { 1 }
  end
end
