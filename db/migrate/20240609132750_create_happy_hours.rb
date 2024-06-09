class CreateHappyHours < ActiveRecord::Migration[7.1]
  def change
    create_table :happy_hours do |t|
      t.string :name
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
