require 'rails_helper'

RSpec.describe 'Ratings API', type: :request do
  describe 'GET /ratings/:uid' do
    let!(:rating) { create(:rating) }

    before { get api_v1_rating_path(rating.uid) }

    context 'with unknown uid' do
      let(:uid) { 'unknown' }

      it { expect(json).to be_empty }
      it { expect(response).to have_http_status(404) }
    end
  end
end
