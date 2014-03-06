class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :amount
      t.string :interval
      t.string :name
      t.string :currency
      t.string :stripe_id

      t.timestamps
    end
  end
end
