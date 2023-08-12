class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cpf
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
