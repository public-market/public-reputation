require 'rails_helper'

RSpec.describe 'Ratings API', type: :request do
  describe 'GET /ratings/:id' do
    let!(:rating) { create(:rating) }

    before { get api_v1_rating_path(uid) }

    context 'with unknown uid' do
      let(:uid) { 'unknown' }

      it { expect(json).to be_empty }
      it { expect(response).to have_http_status(404) }
    end

    context 'with existing uid' do
      let(:uid) { rating.uid }

      it { expect(response).to have_http_status(200) }
      it { expect(json).to include('data') }
      it { expect(json['data']).to include('id' => uid, 'type' => 'rating') }
      it { expect(json['data']).to include('attributes') }
      it { expect(json['data']['attributes']).to include('sender', 'receiver', 'value', 'created_at') }
    end
  end

  describe 'POST /ratings' do
    subject { Rating.last }

    let(:api_key) { create(:api_user).api_key }

    before do
      post api_v1_ratings_path,
           params: {
             data: {
               type: 'rating',
               attributes: attributes
             }
           },
           headers: { 'X-Api-Key' => api_key }
    end

    context 'when api_key is empty' do
      let(:attributes) { { value: 1 } }
      let(:api_key) { nil }

      it { expect(response).to have_http_status(401) }
    end

    context 'when params are invalid' do
      let(:attributes) { {} }

      it { expect(response).to have_http_status(422) }
      it { expect(json).to include('errors') }
      it { expect(json.dig('errors', 0, 'source', 'pointer')).to match('value') }
    end

    context 'when sender and receiver are unknown' do
      let(:attributes) { { value: 1 } }

      it { expect(response).to have_http_status(201) }
      it do
        expect(json).to include('data' =>
          include('attributes' => include('sender', 'receiver', 'value')))
      end
      it { expect(subject.api_user.api_key).to eq(api_key) }
    end

    context 'when receiver is unknown' do
      let(:sender) { create :sender }
      let(:attributes) { { sender: sender.uid, value: 1 } }

      it { expect(response).to have_http_status(201) }
      it { expect(subject.sender).to eq(sender) }
      it { expect(subject.receiver).to be_present }
    end

    context 'when sender is unknown' do
      let(:receiver) { create :receiver }
      let(:attributes) { { receiver: receiver.uid, value: 1 } }

      it { expect(response).to have_http_status(201) }
      it { expect(subject.receiver).to eq(receiver) }
      it { expect(subject.sender).to be_present }
    end

    context 'when sender and receiver are known' do
      let(:sender) { create :sender }
      let(:receiver) { create :receiver }
      let(:attributes) { { sender: sender.uid, receiver: receiver.uid, value: 1 } }

      it { expect(response).to have_http_status(201) }
      it { expect(subject.receiver).to eq(receiver) }
      it { expect(subject.sender).to eq(sender) }
    end
  end

  describe 'PUT /ratings/:id' do
    subject { Rating.last }

    let(:rating) { create(:rating) }
    let(:api_key) { rating.api_user.api_key }
    let(:uid) { rating.uid }
    let(:attributes) { { value: -1 } }

    before do
      put api_v1_rating_path(uid),
          params: {
            data: {
              type: 'rating',
              attributes: attributes
            }
          },
          headers: { 'X-Api-Key' => api_key }
    end

    context 'when modify value correctly' do
      it { expect(response).to have_http_status(200) }
      it { expect(subject.modification).to eq(-1) }
    end

    context 'when rating uid is wrong' do
      let(:uid) { 'WRONG' }

      it { expect(response).to have_http_status(404) }
      it { expect(subject.modification).to be_blank }
    end

    context 'when api user is different' do
      let(:api_key) { create(:api_user).api_key }

      it { expect(response).to have_http_status(404) }
      it { expect(subject.modification).to be_blank }
    end

    context 'when no value provided' do
      let(:attributes) { {} }

      it { expect(response).to have_http_status(200) }
      it { expect(subject.modification).to be_blank }
    end
  end
end
