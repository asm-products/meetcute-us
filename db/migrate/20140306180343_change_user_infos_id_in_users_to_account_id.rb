class ChangeUserInfosIdInUsersToAccountId < ActiveRecord::Migration
  def change
    rename_column :users, :user_info_id, :account_id
  end
end
