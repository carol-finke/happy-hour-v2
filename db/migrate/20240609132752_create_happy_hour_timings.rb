class CreateHappyHourTimings < ActiveRecord::Migration[7.1]
  def change
    create_table :happy_hour_timings do |t|
      t.references :happy_hour, foreign_key: true
      t.string :day_of_week
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
