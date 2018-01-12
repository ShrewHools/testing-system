class AddMainFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :group, :string
  end
end
