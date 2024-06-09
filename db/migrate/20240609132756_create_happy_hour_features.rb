class CreateHappyHourFeatures < ActiveRecord::Migration[7.1]
  def change
    create_table :happy_hour_features do |t|
      t.references :happy_hour, foreign_key: true
      t.references :feature, foreign_key: true

      t.timestamps
    end
  end
end
