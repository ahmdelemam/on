module RestForce
  class DealerPersistor < ApplicationService
    def initialize(account)
      @account = account
    end

    def call
      Dealer.find_or_initialize_by(salesforce_id: account[:Id]) do |dealer|
        dealer.name = account[:Name]
        dealer.city = account[:POS_City__c]
        dealer.country = account[:POS_Country__c]
        dealer.street = account[:POS_Street__c]
        dealer.state = account[:POS_State__c]
        dealer.phone = account[:POS_Phone__c]
        dealer.latitude = account[:Dealer_Latitude__c]
        dealer.longitude = account[:Dealer_Longitude__c]
        dealer.save!
      end
    end

    private

    attr_reader :account
  end
end
