class ChangeLayoutIdToDesignId < ActiveRecord::Migration
  def change
  	rename_column :sites, :layout_id, :design_id
  end
end
