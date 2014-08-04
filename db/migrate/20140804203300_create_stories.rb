class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :site_id
      t.string :title
      t.string :image
      t.text :content
      t.integer :display_order

      t.timestamps
    end
  end
end
