require 'public_market/uid_generator'

# Rating sender
class Sender < ApplicationRecord
  include PublicMarket::UIDGenerator.new(prefix: 'U', letters: true, length: 13)

  has_many :ratings, dependent: :destroy
end
