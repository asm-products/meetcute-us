class RemoveDesignIdFromSites < ActiveRecord::Migration
  def change
    remove_column :sites, :design_id, :integer
  end
end
