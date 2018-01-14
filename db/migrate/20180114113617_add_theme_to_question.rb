class AddThemeToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :theme, :string
    add_column :questions, :literature, :text
  end
end
