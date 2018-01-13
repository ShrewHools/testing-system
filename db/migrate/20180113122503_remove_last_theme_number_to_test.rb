class RemoveLastThemeNumberToTest < ActiveRecord::Migration[5.0]
  def change
    remove_column :tests, :last_theme_number
  end
end
