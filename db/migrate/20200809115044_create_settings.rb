class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.datetime :salesforce_last_fetched_time
      t.timestamps
    end
  end
end
