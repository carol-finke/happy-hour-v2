class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.references :happy_hour, foreign_key: true
      t.string :activity_name

      t.timestamps
    end
  end
end
