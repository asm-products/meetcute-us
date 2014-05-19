class RemoveComponentIdFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :component_id
  end
end
