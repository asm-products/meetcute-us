class ChangeUserInfosTableToAccounts < ActiveRecord::Migration
  def change
    rename_table :user_infos, :accounts
  end
end
