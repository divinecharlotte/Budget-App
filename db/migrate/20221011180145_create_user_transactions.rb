class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.string :name
      t.integer :amount, :default => 0

      t.timestamps
    end
  end
end
