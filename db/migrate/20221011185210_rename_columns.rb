class RenameColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :groups, :user_id, :author_id
    rename_column :user_transactions, :user_id, :author_id
    rename_column :user_transactions, :groups_id, :group_id
  end
end