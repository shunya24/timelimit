class CreateShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppings do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.integer :count
      t.timestamps
    end
  end
end
