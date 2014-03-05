class AddSubDomainToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :sub_domain, :string
  end
end
