class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :salesforce_id, index: true, uniq: true
      t.string :name
      t.string :city
      t.string :country
      t.string :street
      t.string :state
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.timestamps
    end
  end
end
