class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :title
      t.text :description
      t.integer :component_id

      t.timestamps
    end
  end
end
