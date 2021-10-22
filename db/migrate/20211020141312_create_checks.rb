class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.references :user, null: false
      t.references :shopping, null: false
      t.timestamps
    end
  end
end
