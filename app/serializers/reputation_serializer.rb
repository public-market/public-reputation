class ReputationSerializer
  include FastJsonapi::ObjectSerializer

  set_id :uid
  set_type :reputation

  attribute :ratings do |receiver|
    receiver.ratings.count
  end

  attribute :score do |receiver|
    ratings = receiver.ratings.where('modification is null or modification = value')
    if ratings.count.zero?
      nil
    else
      positive_ratings = ratings.where(value: 1)
      1.0 * positive_ratings.count / ratings.count
    end
  end
end
