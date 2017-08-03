class CreateHashTags < ActiveRecord::Migration[5.0]
  def change
    create_table :hash_tags do |t|
      t.string :tag
      t.references :race, foreign_key: true

      t.timestamps
    end
  end
end
