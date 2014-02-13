class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :ammount
      t.string :plan_interval
      t.string :name
      t.string :currency
      t.string :plan_id

      t.timestamps
    end
  end
end
