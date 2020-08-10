module RestForce
  class Connector
    attr_reader :client

    def initialize
      @client = Restforce.new(
        host: ENV['RESTFORCE_USER_HOST'],
        username: ENV['RESTFORCE_USER_NAME'],
        password: ENV['RESTFORCE_USER_PASSWORD'],
        client_id: ENV['RESTFORCE_USER_CLIENT_ID'],
        client_secret: ENV['RESTFORCE_USER_CLIENT_SECRET'],
        )
      client.authenticate!
    end

    def self.client
      new.client
    end
  end
end
