require 'rails_helper'

RSpec.describe Sender, type: :model do
  it { should have_many(:ratings).dependent(:destroy) }

  describe 'factory' do
    let(:sender) { create :sender }

    it { expect(sender.uid.length).to eq(14) }
    it { expect(sender.uid).to start_with('U') }
  end
end
