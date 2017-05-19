class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.date :date
      t.string :name
      t.string :distance
      t.datetime :results

      t.timestamps
    end
  end
end
