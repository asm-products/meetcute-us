class ChangeSubscriptionsTable < ActiveRecord::Migration
  def change
    add_column :subscriptions, :stripe_customer_token, :string
    remove_column :subscriptions, :ammount
    remove_column :subscriptions, :plan_interval
    remove_column :subscriptions, :currency
    remove_column :subscriptions, :name
  end
end