class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :type
      t.string :summary
      t.string :difficulty
      t.string :location
      t.string :url
      t.string :img_sq_small
      t.string :img_small
      t.string :img_small_med
      t.string :img_medium
      t.string :length
      t.string :ascent
      t.string :descent
      t.integer :trail_api_id
      t.string :condition_status
      t.string :condition_details

      t.timestamps
    end
  end
end
