class RemoveSiteIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :site_id, :integer
  end
end
