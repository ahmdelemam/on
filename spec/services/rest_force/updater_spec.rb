RSpec.describe RestForce::Updater, type: :service do
  subject { described_class }

  around do |example|
    VCR.use_cassette('sales_force_dealers') do
      example.run
    end
  end

  before do
    Setting.first_or_create.update(salesforce_last_fetched_time: nil)
  end

  it 'imports all dealers from salesforce' do
    described_class.call
    dealer = Dealer.first
    expect(Dealer.count).to eq(6826)
    expect(dealer.salesforce_id).not_to be_nil
    expect(dealer.name).not_to be_nil
  end
end
