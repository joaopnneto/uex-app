class AddFieldToAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :neighborhood, :string
  end
end
