class AddSiteIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :site_id, :integer
  end
end
