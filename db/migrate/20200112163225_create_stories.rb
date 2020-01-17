class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :short_description
      t.text :full_story
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
