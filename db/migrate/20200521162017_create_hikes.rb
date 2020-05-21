class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trail, null: false, foreign_key: true
      t.boolean :completed
      t.boolean :favorite
      t.integer :rating

      t.timestamps
    end
  end
end
