class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :contact, null: false, foreign_key: true
      t.string :street
      t.string :number
      t.string :complement
      t.string :zip_code
      t.string :city
      t.string :uf
      t.string :country

      t.timestamps
    end
  end
end
