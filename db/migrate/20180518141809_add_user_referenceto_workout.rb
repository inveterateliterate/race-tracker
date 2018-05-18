class AddUserReferencetoWorkout < ActiveRecord::Migration[5.2]
  def change
    add_reference :workouts, :user, index: true
  end
end
