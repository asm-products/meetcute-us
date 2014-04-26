class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.string :analytics
      t.boolean :password_protected
      t.boolean :is_indexed
      t.integer :layout_id

      t.timestamps
    end
  end
end
