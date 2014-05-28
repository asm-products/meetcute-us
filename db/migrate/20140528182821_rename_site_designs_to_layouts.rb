class RenameSiteDesignsToLayouts < ActiveRecord::Migration
  def change
  	rename_table :site_designs, :layouts
  end
end
