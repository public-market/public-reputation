require 'rails_helper'

RSpec.describe 'Reputations API', type: :request do
  describe 'GET /reputations/:id' do
    let(:receiver) { create(:receiver) }
    let!(:positive_ratings) { create_list(:rating, 5, receiver: receiver, value: 1) }
    let!(:megative_ratings) { create_list(:rating, 3, receiver: receiver, value: -1) }

    before { get api_v1_reputation_path(uid) }

    context 'with unknown uid' do
      let(:uid) { 'unknown' }

      it { expect(json).to be_empty }
      it { expect(response).to have_http_status(404) }
    end

    context 'with existing uid' do
      let(:uid) { receiver.uid }

      it { expect(response).to have_http_status(200) }
      it { expect(json).to include('data') }
      it { expect(json['data']).to include('id' => uid, 'type' => 'reputation') }
      it { expect(json['data']).to include('attributes') }
      it { expect(json['data']['attributes']).to include('positive' => 5, 'negative' => 3) }
    end
  end
end
