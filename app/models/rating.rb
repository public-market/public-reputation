require 'public_market/uid_generator'

# Rating value
class Rating < ApplicationRecord
  include PublicMarket::UIDGenerator.new(prefix: 'V', letters: true, length: 13)

  belongs_to :sender
  belongs_to :receiver

  validates_presence_of :value
end
