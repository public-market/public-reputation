class ReputationSerializer
  include FastJsonapi::ObjectSerializer

  set_id :uid
  set_type :reputation

  attribute :positive do |receiver|
    receiver.ratings.where(value: 1).count
  end

  attribute :negative do |receiver|
    receiver.ratings.where(value: -1).count
  end
end
