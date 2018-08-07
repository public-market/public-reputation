require 'public_market/uid_generator'

# Rating value
class Rating < ApplicationRecord
  include PublicMarket::UIDGenerator.new(prefix: 'V', letters: true, length: 13)

  belongs_to :api_user
  belongs_to :sender
  belongs_to :receiver

  validates :value, presence: true

  def modify!(new_value, new_review = nil)
    return if new_value.blank?

    update(modification: new_value, review: new_review || review)
  end
end
