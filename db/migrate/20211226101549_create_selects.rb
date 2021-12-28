class CreateSelects < ActiveRecord::Migration[6.0]
  def change
    create_table :selects do |t|
      t.references :user, null: false
      t.references :food, null: false
      t.timestamps
    end
  end
end
