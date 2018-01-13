class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.references :user
      t.references :subject
      t.integer :last_theme_number, default: 1
      t.integer :last_question_number, default: -1
      t.boolean :end_page, default: false
      t.timestamps
    end
  end
end
