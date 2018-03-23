require 'public_market/uid_generator'

# Rating receiver
class Receiver < ApplicationRecord
  include PublicMarket::UIDGenerator.new(prefix: 'R', letters: true, length: 13)

  has_many :ratings, dependent: :destroy

  validates_presence_of :uid
end
