class Dealer < ApplicationRecord
  validates :salesforce_id, uniqueness: true, presence: true
  validates :name, presence: true
end
