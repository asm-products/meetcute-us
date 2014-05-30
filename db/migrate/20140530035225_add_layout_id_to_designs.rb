class AddLayoutIdToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :layout_id, :integer
  end
end
