require 'rails_helper'

RSpec.describe Receiver, type: :model do
  it { should have_many(:ratings).dependent(:destroy) }

  describe 'factory' do
    let(:receiver) { create :receiver }

    it { expect(receiver.uid.length).to eq(14) }
    it { expect(receiver.uid).to start_with('R') }
  end
end
