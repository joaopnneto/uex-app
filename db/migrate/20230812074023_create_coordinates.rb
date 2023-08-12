class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.string :longitude
      t.string :latitude
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
