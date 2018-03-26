class ApiUser < ApplicationRecord
  before_create :generate_api_key

  validates :url, presence: true

  private

  def generate_api_key
    self.api_key ||= SecureRandom.hex(13)
  end
end
