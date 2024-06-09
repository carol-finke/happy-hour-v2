class CreateRooftops < ActiveRecord::Migration[7.1]
  def change
    create_table :rooftops do |t|
      t.references :happy_hour, foreign_key: true

      t.timestamps
    end
  end
end
