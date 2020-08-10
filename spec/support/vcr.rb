require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('<RESTFORCE_USER_HOST>') { ENV['RESTFORCE_USER_HOST'] }
  config.filter_sensitive_data('<RESTFORCE_USER_NAME>') { ENV['RESTFORCE_USER_NAME'] }
  config.filter_sensitive_data('<RESTFORCE_USER_PASSWORD>') { ENV['RESTFORCE_USER_PASSWORD'] }
  config.filter_sensitive_data('<RESTFORCE_USER_CLIENT_ID>') { ENV['RESTFORCE_USER_CLIENT_ID'] }
  config.filter_sensitive_data('<RESTFORCE_USER_CLIENT_SECRET>') { ENV['RESTFORCE_USER_CLIENT_SECRET'] }
end
