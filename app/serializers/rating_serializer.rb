class RatingSerializer
  include FastJsonapi::ObjectSerializer

  set_id :uid
  attributes :value, :modification, :created_at, :review

  attribute :sender do |rating|
    rating.sender.uid
  end

  attribute :receiver do |rating|
    rating.receiver.uid
  end
end
