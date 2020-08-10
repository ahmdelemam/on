module RestForce
  class Updater < ApplicationService
    def initialize
      @setting = Setting.first_or_create
    end

    def call
      if setting.salesforce_last_fetched_time.nil?
        first_import
      else
        sync_updated
        sync_deleted
      end
      setting.touch(:salesforce_last_fetched_time)
    end

    private

    attr_reader :setting

    def first_import
      Account.all_dealers.each do |account|
        DealerPersistor.call(account)
      end
    end

    def sync_updated
      Account.updated_ids.each do |id|
        account = Account.select(id)
        DealerPersistor.call(account) if dealer?(account)
      end
    end

    def sync_deleted
      deleted_ids = Account.deleted_ids
      return if deleted_ids.nil?

      deleted_ids.each do |id|
        Dealer.find_by(salesforce_id: id).destroy
      end
    end

    def dealer?(account)
      account[:E_Shop_Dealer__c] == 'Dealer and Point of Sale'
    end
  end
end
