RSpec.describe 'Reputations API', type: :request do
  describe 'GET /reputations/:id' do
    let(:receiver) { create(:receiver) }
    let!(:positive_ratings) { create_list(:rating, 5, receiver: receiver, value: 1) }
    let!(:negative_ratings) { create_list(:rating, 3, receiver: receiver, value: -1) }
    let!(:modified_ratings) { create_list(:rating, 2, receiver: receiver, value: -1, modification: 1) }

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
      it { expect(json['data']['attributes']).to include('ratings' => 10, 'score' => 5.0 / 8) }
    end

    context 'when all ratings with modifications' do
      let(:new_receiver) { create(:receiver) }
      let!(:modified_ratings) { create_list(:rating, 2, receiver: new_receiver, value: -1, modification: 1) }
      let(:uid) { new_receiver.uid }

      it { expect(response).to have_http_status(200) }
      it { expect(json['data']['attributes']).to include('ratings' => 2, 'score' => nil) }
    end
  end
end
