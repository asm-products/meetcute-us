class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :stripe_customer_token
      t.date :wedding_date
      t.integer :subscription_id
      t.integer :site_id

      t.timestamps
    end
  end
end
