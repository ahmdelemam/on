RSpec.describe Api::V1::DealersController, type: :controller do
  describe 'GET /dealers' do
    subject(:index) { get :index }

    let(:params) { {} }

    it 'returns status ok' do
      index
      expect(response).to have_http_status(:ok)
      expect(response_body.length).to eq(30)
      dealer = response_body.first
      expect(dealer['salesforce_id']).not_to be_nil
      expect(dealer['name']).not_to be_nil
      expect(dealer['city']).not_to be_nil
      expect(dealer['country']).not_to be_nil
      expect(dealer['street']).not_to be_nil
      expect(dealer['state']).not_to be_nil
      expect(dealer['phone']).not_to be_nil
      expect(dealer['latitude']).not_to be_nil
      expect(dealer['longitude']).not_to be_nil
      expect(dealer['created_at']).not_to be_nil
      expect(dealer['updated_at']).not_to be_nil
    end
  end
end
