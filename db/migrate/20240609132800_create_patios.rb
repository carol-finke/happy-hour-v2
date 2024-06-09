class CreatePatios < ActiveRecord::Migration[7.1]
  def change
    create_table :patios do |t|
      t.references :happy_hour, foreign_key: true

      t.timestamps
    end
  end
end
