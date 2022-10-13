class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_transactions, :user, null: false, foreign_key: true, on_delete: :cascade
    add_reference :groups, :user, null: false, foreign_key: true, on_delete: :cascade
    add_reference :user_transactions, :groups, null: false, foreign_key: true, on_delete: :cascade
  end
end