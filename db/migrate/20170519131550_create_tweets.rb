class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.date :date
      t.string :content
      t.references :user, foreign_key: true
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
