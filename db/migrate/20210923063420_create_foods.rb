class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.text :content
      t.date :limit
      t.integer :count
      t.timestamps
    end
  end
end
