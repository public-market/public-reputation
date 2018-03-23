require 'public_market/uid_generator'

# Rating sender
class Sender < ApplicationRecord
  include PublicMarket::UIDGenerator.new(prefix: 'S', letters: true, length: 10)

  has_many :ratings, dependent: :destroy

  # validates_presence_of :uid
end
