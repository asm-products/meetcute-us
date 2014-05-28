class CreateSiteDesigns < ActiveRecord::Migration
  def change
    create_table :site_designs do |t|
      t.integer :design_id
      t.integer :site_id

      t.timestamps
    end
  end
end
