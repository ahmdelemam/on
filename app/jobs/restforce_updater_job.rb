class RestforceUpdaterJob < ApplicationJob
  queue_as :default

  def perform
    RestForce::Updater.call
  end
end
