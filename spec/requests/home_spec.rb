RSpec.describe 'Root url', type: :request do
  describe 'GET /' do
    before { get root_path }

    it { expect(json).to be_empty }
  end
end
