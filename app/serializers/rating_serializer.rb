class RatingSerializer
  include FastJsonapi::ObjectSerializer

  set_id :uid
  attributes :value, :created_at

  attribute :sender do |rating|
    rating.sender.uid
  end

  attribute :receiver do |rating|
    rating.receiver.uid
  end
end
