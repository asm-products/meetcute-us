class RemoveSiteIdFromDesigns < ActiveRecord::Migration
  def change
    remove_column :designs, :site_id, :integer
  end
end
