require 'rails_helper'

RSpec.describe Rating, type: :model do
  it { should belong_to(:sender) }
  it { should belong_to(:receiver) }
  it { should belong_to(:api_user) }

  it { should validate_presence_of(:value) }

  describe 'factory' do
    let(:rating) { create :rating }

    it { expect(rating.uid.length).to eq(14) }
    it { expect(rating.uid).to start_with('V') }
    it { expect(rating.value).to eq(1) }
  end

  describe 'modify!' do
    let(:rating) { create :rating }

    before { rating.modify!(-1) }

    it { expect(rating.modification).to eq(-1) }
    it { expect(rating.updated_at).to be_present }
  end
end
