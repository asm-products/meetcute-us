class ChangeLayoutsToDesigns < ActiveRecord::Migration
  def change
    rename_table :layouts, :designs
  end
end
