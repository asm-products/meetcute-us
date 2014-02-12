class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :subscription_id, :integer
    remove_column :users, :username, :string
  end
end