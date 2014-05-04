class AddSiteIdToLayouts < ActiveRecord::Migration
  def change
    add_column :layouts, :site_id, :integer
  end
end
