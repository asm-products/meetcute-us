class RemoveSubDomainFromAccounts < ActiveRecord::Migration
  def change
    remove_column :accounts, :sub_domain, :string
  end
end
