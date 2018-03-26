require 'rails_helper'

RSpec.describe ApiUser, type: :model do
  it { should validate_presence_of(:url) }

  describe 'factory' do
    let(:api_user) { create :api_user }

    it { expect(api_user.url).to be_present }
    it { expect(api_user.api_key).to be_present }
  end
end
