class AddGroupToStatistic < ActiveRecord::Migration[5.0]
  def change
    add_column :statistics, :group, :string
  end
end
