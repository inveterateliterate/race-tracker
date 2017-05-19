class AddUserReferencetoRaces < ActiveRecord::Migration[5.0]
  def change
    add_reference :races, :user, index: true
    add_foreign_key :races, :users
  end
end
