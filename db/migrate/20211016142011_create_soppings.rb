class CreateSoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :soppings do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
