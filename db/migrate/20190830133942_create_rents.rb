class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :rent_in, null: false
      t.date :rent_out, null: false

      t.timestamps
    end
  end
end
