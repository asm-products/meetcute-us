class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :site_id
      t.integer :user_info_id
      t.integer :subscription_id
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
