RSpec.describe RestforceUpdaterJob, type: :job do
  describe '#perform' do
    subject(:perform) { described_class.new.perform }

    it 'calls ExpirationReminder service' do
      expect(RestForce::Updater).to receive(:call)
      perform
    end
  end
end
