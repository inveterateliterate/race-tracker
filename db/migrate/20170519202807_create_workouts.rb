class CreateWorkouts < ActiveRecord::Migration[5.0]
  def change
    create_table :workouts do |t|
      t.string :start_time
      t.string :end_time
      t.float :distance
      t.float :speed
      t.float :pace
      t.integer :race_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
