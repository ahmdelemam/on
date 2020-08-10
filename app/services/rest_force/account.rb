module RestForce
  class Account
    ATTRIBUTES = [
      :Id, :E_Shop_Dealer__c, :Name, :POS_Street__c, :POS_City__c, :POS_Country__c,
      :POS_State__c, :POS_Phone__c, :Dealer_Latitude__c, :Dealer_Longitude__c
    ].freeze

    attr_reader :client, :setting

    def initialize(client = Connector.client)
      @client = client
      @setting = Setting.first
    end

    class << self
      def all
        client.query_all("select #{attributes} from #{object_name}")
      end

      def all_dealers
        client.query_all("select #{attributes} from #{object_name} where E_Shop_Dealer__c = 'Dealer and Point of Sale'")
      end

      def updated_ids
        client.get_updated(object_name, setting.salesforce_last_fetched_time, Time.current).ids
      end

      def deleted_ids
        deleted = client.get_deleted(object_name, setting.salesforce_last_fetched_time, Time.current)
        deleted[:deletedRecords].map { |record| record[:id] }
      end

      def select(id)
        client.select(object_name, id, ATTRIBUTES)
      end

      private

      def attributes
        ATTRIBUTES.map(&:to_s).join(',')
      end

      def client
        new.client
      end

      def setting
        new.setting
      end

      def object_name
        name.split('::').last
      end
    end
  end
end
