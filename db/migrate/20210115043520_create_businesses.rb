class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :description
      t.string :website
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.references :neighborhood, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
