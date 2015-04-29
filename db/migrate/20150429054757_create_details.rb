class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.date :timestamp
      t.string :city
      t.float :transacted_amount
      t.string :status

      t.timestamps null: false
    end
  end
end
